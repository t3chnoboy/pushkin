fs         = require 'fs'
koa        = require 'koa'
router     = require 'koa-router'
request    = require 'co-request'
solve      = require '../lib/solver'
bodyParser = require 'koa-bodyparser'

url   = 'http://pushkin-contest.ror.by/quiz'
token = fs.readFileSync './token.txt', 'utf8'

app = koa()
app.use(bodyParser())
app.use router(app)

app.post '/registration', -->
  token = @request.body.token
  console.log @request.body
  fs.writeFileSync 'token.txt', @request.body.token
  @body =
    answer: 'снежные'

app.post '/quiz', -->
  body = @request.body
  answer = solve '' + body.level, body.question
  response =
    token:    token
    answer:   answer
    task_id:  body.id

  result = yield request
      uri:     url
      form:    response
      method:  'POST'

  console.log body, response, result.body
  console.log '-'.repeat 50

app.listen(process.env.PORT || 5000)
