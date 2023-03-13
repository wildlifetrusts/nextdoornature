import reset from "/src/css/reset.css?inline";
import { Elm } from "/src/Main.elm";

import guides from "../../data/guides.json";

const app = Elm.Main.init({ flags: { guides } });
