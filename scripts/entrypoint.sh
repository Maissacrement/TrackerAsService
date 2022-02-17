#!/usr/bin/env bash
rundev () {
    yarn dev
}
rundev;tail -f ${PWD}/scripts/list.txt;