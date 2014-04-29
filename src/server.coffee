fs         = require 'fs'
koa        = require 'koa'
request    = require 'co-request'
solve      = require '../lib/solver'
bodyParser = require 'koa-bodyparser'
router     = require 'koa-route'

url   = 'http://pushkin-contest.ror.by/quiz'
token = fs.readFileSync './token.txt', 'utf8'

app = koa()
app.use(bodyParser())

app.use router.post '/quiz', -->
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

  console.log 'request:'
  console.log body
  console.log 'response:'
  console.log response
  console.log 'result:'
  console.log result.body
  console.log '-'.repeat 50

app.use router.post '/registration', -->
  token = @request.body.token
  console.log @request.body
  fs.writeFileSync 'token.txt', @request.body.token
  @body =
    answer: 'снежные'

app.listen(process.env.PORT || 5000)
