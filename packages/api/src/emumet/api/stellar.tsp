import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "../../common/status-code.tsp";
import "../../common/query";
import "../../common/body";

using TypeSpec.Http;
using TypeSpec.Rest;
using Common;

@tag("stellar")
@route("/stellar")
namespace Emumet.API.StellarAPI;

@format("uuid")
scalar StellarId extends string;

@format("uuid")
scalar HostId extends string;

@route("/hosts")
namespace Hosts {
  model HostResponse {
    id: HostId;
    url: url;
  }

  @get
  op get(...Query.ArrayLimitQueries): {
    ...StatusCode.Success;

    @body
    body: Common.Body.ArrayLimitedResponse<HostId>;
  } | StatusCode.BadRequest | StatusCode.InternalError;

  @route("/{id}")
  @get
  op getHost(id: HostId):
    | {
        ...StatusCode.Success;

        @body
        body: HostResponse;
      }
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;
}

@route("/accounts")
namespace Accounts {
  model AccountResponse {
    id: StellarId;
    host_id: HostId;
  }

  @get
  op get(...Query.ArrayLimitQueries): {
    ...StatusCode.Success;

    @body
    body: Common.Body.ArrayLimitedResponse<StellarId>;
  } | StatusCode.BadRequest | StatusCode.InternalError;

  @route("/{id}")
  @get
  op getAccount(id: StellarId):
    | {
        ...StatusCode.Success;

        @body
        body: AccountResponse;
      }
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;
}
