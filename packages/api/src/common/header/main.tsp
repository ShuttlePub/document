import "@typespec/http";
import "./accept.tsp";
import "./content-type.tsp";

using TypeSpec.Http;

namespace Common.Header;

model HttpSignatures {
  @header
  Signature: string;

  @header
  Authorization?: string;
}
