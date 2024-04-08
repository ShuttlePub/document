import "../common";

namespace Common.JsonLd;

model ContextMap {
  `@id`: Types.IRI;
  `@type`: string = "@id";
}

alias Context = Types.IRI | Record<Types.IRI | ContextMap>;
