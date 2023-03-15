import reset from "/src/css/reset.css?inline";
import { Elm } from "/src/Main.elm";

import guides from "../../data/guides.json";
import stories from "../../data/stories.json";

const app = Elm.Main.init({ flags: { guides, stories } });
