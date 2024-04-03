import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.Rest;

@tag("stellar")
@route("/stellar")
namespace Emumet.API.StellarAPI;

@format("uuid")
scalar StellarId extends string;

