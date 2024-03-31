import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "../common/status-code.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using Common;

@tag("webfinger")
@route("/.well-known/webfinger")
@doc("https://tools.ietf.org/html/rfc7033")
namespace Emumet.WebfingerAPI;

model Response {
  @doc("The subject of the WebFinger query.")
  subject: string = "acct:example@example.com";

  @doc("The canonical URI of the resource identified by the subject.")
  links: Link[];
}

model Link {
  @doc("The relation type that the client can use to interact with the resource identified by the subject.")
  rel: string = "self";

  @doc("The media type that the client can use to interact with the resource identified by the subject.")
  type: string = "application/activity+json";

  @doc("The URI of the resource identified by the subject.")
  href: string = "https://example.com/actor";
}

@doc("The acct URI. Example: acct:example@example.com")
scalar Acct extends string;
@doc("The URI. Example: https://example.com/actor")
scalar URI extends string;

interface Webfinger {
  @doc("The WebFinger query.")
  @get
  get(
    @doc("The resource to query")
    @query("resource")
    resource: Acct | URI,
  ):
    | {
        ...StatusCode.Success;

        @body
        body: Response;
      }
    | StatusCode.BadRequest
    | StatusCode.NotFound
    | StatusCode.InternalError;
}
