import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "@typespec/versioning";
import "./api";
import "./user.tsp";
import "./webfinger.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;

@service({
  title: "Emumet REST API",
})
@server(
  "/",
  "Emument flagship server endpoint",
  {
    apiVersion: EmumetVersions = EmumetVersions.v1,
  }
)
@versioned(EmumetVersions)
namespace Emumet;

enum EmumetVersions {
  v1,
}
