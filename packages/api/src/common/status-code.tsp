import "@typespec/http";

using TypeSpec.Http;

namespace Common.StatusCode {
  model Success {
    @statusCode
    statusCode: 200;
  }
  model BadRequest {
    @statusCode
    statusCode: 400;
  }
  model NotFound {
    @statusCode
    statusCode: 404;
  }
  model Conflict {
    @statusCode
    statusCode: 409;
  }
  model InternalError {
    @statusCode
    statusCode: 500;
  }
}
