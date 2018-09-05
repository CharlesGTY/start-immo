import "bootstrap";
import "../components/navbar-fixed.js";
import {initMap} from "../components/map.js";
import "../components/tooltip";
import {displayAlert} from "../components/alter";

initMap();
global.displayAlert = displayAlert;

