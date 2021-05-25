@echo off
::Provide a space separated list of scripts to run, or provide nothing to run them all
::EX: "node ApexScriptLoader.js SampleScript" will run only SampleScript" 
::EX: "node ApexScriptLoader.js" will run all scripts in the scripts folder sequentially
node ApexScriptLoader.js


::TIMEOUT 30
pause