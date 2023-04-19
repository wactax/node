#!/usr/bin/env coffee

> @w5/render/str:

console.log "${0}".render(321)
console.log "${test}".render({test:456})
console.log "[${host}] ${action}验证码：${code}\n\n[${host}](https://${host}) ${action}验证码：${code}.\n\n此验证码将在一小时后失效。\n\n如果你未曾申请[${host}](https://${host})${action}，请忽略此邮件。\n".render(
  host:"wac.tax"
  action: "注册"
  code: "fdjaiSW"
)
