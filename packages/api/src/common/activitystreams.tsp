import "../common/json-ld.tsp";

namespace Common.ActivityStreams;

model WithContext {
  `@context`: JsonLd.Context[] | JsonLd.Context;
}

model Image {
  type: "Image";
  url: url;
  mediaType?: "image/png" | "image/webp" | "image/gif";
  sensitive?: boolean = false;
  name?: string;
}

model Document {
  type: "Document";
  url: url;
  mediaType: "image/png" | "image/webp" | "image/gif" | "video/quicktime";
  name?: string;
}

model Mention {
  type: "Mention";

  @doc("id(local) or acct(foreign)")
  name: "@actor" | "@actor@example.com";

  href: url;
}

model HashTag {
  type: "Hashtag";
  name: string = "#tag";
  href: url;
}

model Emoji {
  id: url;
  type: "Emoji";
  name: string = ":id:";
  url: url;
  updated: utcDateTime;
  icon: Image;
}

@doc("FEP-e232: https://codeberg.org/fediverse/fep/src/branch/main/fep/e232/fep-e232.md")
model Link {
  type: "Link";
  href: url;
  name: string;
  mediaType: "application/ld+json; profile=\"https://www.w3.org/ns/activitystreams\"";
}

model BaseObject<Type extends string> {
  type: Type;
  id: url;
}

model Create extends BaseObject<"Create"> {
  actor: url;
  object: Note | BaseObject<string>;
  published: utcDateTime;
  to: url[];
  cc: url[];
}

model CreateWithContext is Create {
  ...WithContext;
}

// TODO: Needs more research
model Update extends BaseObject<"Update"> {
  actor: url;
  object: Note | BaseObject<string>;
  updated: utcDateTime;
  to: url[];
  cc: url[];
}

model UpdateWithContext is Update {
  ...WithContext;
}

// TODO: Needs more research
model Delete extends BaseObject<"Delete"> {
  actor: url;
  object: url;
  deleted: utcDateTime;
}

model DeleteWithContext is Delete {
  ...WithContext;
}

model Note extends BaseObject<"Note"> {
  @doc("The creator of this note")
  attributedTo: url;

  content: string;
  published: utcDateTime;
  inReplyTo?: url;
  attachment: Document[];

  @doc("If sensitive is true, this field treated as cotnent warning")
  summary: string;

  @doc("as:sentitive required in @context")
  sensitive: boolean;

  tag: (HashTag | Mention | Emoji | Link)[];
  to: url[];
  cc: url[];

  @doc("as:quoteUrl required in @context")
  quoteUrl?: url;
}

model Announce extends BaseObject<"Announce"> {
  actor: url;
  object: url;
  published: utcDateTime;
  to: url[];
  cc: url[];
}

model AnnounceWithContext is Announce {
  ...WithContext;
}

// TODO: Needs more research
model Follow extends BaseObject<"Follow"> {
  actor: url;

  @doc("Follow target")
  object: url;
}

model FollowWithContext is Follow {
  ...WithContext;
}

// TODO: Needs more research
model Like extends BaseObject<"Like"> {
  actor: url;

  @doc("Like target")
  object: url;
}

model LikeWithContext is Like {
  ...WithContext;
}

// TODO: Needs more research
model Block extends BaseObject<"Block"> {
  actor: url;

  @doc("Block target")
  object: url;
}

model BlockWithContext is Block {
  ...WithContext;
}

// TODO: Needs more research
model Undo extends BaseObject<"Undo"> {
  actor: url;

  @doc("Undo target")
  object: url;
}

model UndoWithContext is Undo {
  ...WithContext;
}

model OrderedCollection extends BaseObject<"OrderedCollection"> {
  ...WithContext;
  totalItems: integer;
  first: url;
  last?: url;
}

model OrderedCollectionPage extends BaseObject<"OrderedCollectionPage"> {
  ...WithContext;
  partOf: url;
  next?: url;
  prev?: url;
  orderedItems: (Announce | Create)[];
}
