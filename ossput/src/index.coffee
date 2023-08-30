#!/usr/bin/env coffee

> @aws-sdk/client-s3 > S3Client
  @aws-sdk/lib-storage > Upload
  @aws-sdk/node-http-handler > NodeHttpHandler
  https-proxy-agent:agent
  util > promisify
  ./conf.js
  assert > strict:assert

{https_proxy} = process.env
if https_proxy
  console.log "@w5/ossput use https_proxy",https_proxy
  requestHandler = new NodeHttpHandler({
    httpsAgent: new agent.HttpsProxyAgent(https_proxy)
  })

bind = ([url, Bucket, conf, seller])=>
  conf.region = conf.region or 'us-east-1'
  if requestHandler
    conf.requestHandler = requestHandler

  client = new S3Client conf

  (params, body)=>
    n = 10
    loop
      try
        up = new Upload {
          client
          queueSize: 4
          partSize: 5242880
          leavePartsOnError: false
          params:{
            Bucket
            Body: body()
            ...params
          }
        }
        up.on(
          'httpUploadProgress'
          ({loaded, total}) =>
            tip = [
              seller
              params.Key
            ]
            if total
              tip.push Math.round(loaded*10000/total)/100+'%'
            console.log '\t '+tip.join ' '
            return
        )
        await up.done()
        break
      catch err
        if --n
          continue
        else
          console.error "@w5/ossput ERROR",conf, params.Key
          throw err
    console.log url+'/'+params.Key
    return

put = (args...)=>
  bucket = process.env.OSSPUT_BUCKET
  assert (!!bucket),'NO ENV OSSPUT_BUCKET'
  # 从环境变量加载配置
  li = (await conf(bucket)).map bind

  put = (Key, body, contentType)=>
    o = {
      Key
    }

    if contentType
      o.ContentType = contentType

    await Promise.all li.map (_put)=>
      _put o,body

    return

  put(...args)

< (args...)=>
  put(...args)
