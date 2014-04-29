fs      = require 'fs'
koa     = require 'koa'
parse   = require 'co-body'
router  = require 'koa-router'
request = require 'co-request'
solve   = require '../lib/solver'

url   = 'http://pushkin-contest.ror.by/quiz'
token = fs.readFileSync './token.txt', 'utf8'

app = koa()
app.use router(app)

app.post '/registration', -->
  body = yield parse @, limit: '1kb'
  console.log body
  token = body.token
  fs.writeFileSync 'token.txt', body.token
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

  console.log body, response, result.body
  console.log '-'.repeat 50

app.listen(process.env.PORT || 5000)
