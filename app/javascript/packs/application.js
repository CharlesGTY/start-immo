import "bootstrap";
import "../components/navbar-fixed.js";
import {initMap} from "../components/map.js";
import {loading} from "../components/loading.js"
import "../components/tooltip";
import {displayAlert} from "../components/alter";

initMap();
loading();
global.displayAlert = displayAlert;
