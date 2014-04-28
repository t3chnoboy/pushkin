koa = require 'koa'
router = require 'koa-router'
parse = require 'co-body'
solve = require '../lib/solver'
fs = require 'fs'
request = require 'co-request'

token = fs.readFileSync './token.txt', 'utf8'
url = 'http://pushkin-contest.ror.by/quiz'

app = koa()
app.use router(app)

app.post '/registration', -->
  body = yield parse @, limit: '1kb'
  console.log body
  token = body.token
  fs.writeFileSync './token.txt', body.token
  @body =
    answer: 'снежные'

app.post '/quiz', -->
  body = yield parse @, limit: '1kb'
  answer = solve '' + body.level, body.question
  response =
    answer: answer
    token: token
    task_id: body.id

  result = yield request
      uri: url
      method: 'POST'
      form: response

  console.log body
  console.log result.body
  console.log response

app.listen(process.env.PORT || 5000)
