import "@typespec/http";

using TypeSpec.Http;

namespace Common.StatusCode {
  model Success {
    @statusCode
    statusCode: 200;
  }
  model Accepted {
    @statusCode
    statusCode: 202;
  }
  model BadRequest {
    @statusCode
    statusCode: 400;
  }
  @doc("Authorized, but not permitted")
  model Forbidden {
    @statusCode
    statusCode: 403;
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
