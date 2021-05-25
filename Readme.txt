Apex Script Loader

What is it? 
Apex script loader is a node.js application for running execute anonymous apex scripts against a Salesforce org. It provides a way to run pre-written scripts via the terminal and provide configuration information to them at run time while providing quality logs. If you have daily processes you have to do that could be done via an apex script but you're tired of having to log in and run it every day then this may be for you.

How to use it?
You must first have authorized the org you intended to run your script against using SFDX. In the scripts folder create a folder for your new script. It will contain three files, a JSON configuration file, and the Apex script to run, and a JSON 'variables' file that contains any values that you need to pass into your script. 

To run your script simply call it from the terminal by passing the name of your script folder as a parameter to the ApexScriptLoader.js file. EX

node ApexScriptLoader.js FixCases

where FixCases is the name of your script folder. In that folder the config file must be named config.json.

Alternatively if you call ApexScriptLoader.js with no arguments it will run all the scripts in your scripts folder.

What goes in my Config.JSON file?
At the bare minimum you need the username that connects to the org you want to run the script against, the name of the file that contains the apex code, and the name of the variables file.
The rest is optional. Here is an example of a bare minimum file

{
"apexScriptFile": "FixCases.apex",
"username": "Kenji776@mySalesforceOrg.com"
"injectionVariablesFile": ["variables.json"]
}

Here is one with more details, mostly useful if you intend to distribute your scripts so people can know what they are getting.

{
"apexScriptFile": "SampleScript.apex",
"username": "username@org.com",
"apexResultFile": "executeResult.txt",
"applicationName": "Sample Apex Script",
"description": "A Sample Script To Show The File Structure and Config"",
"author": "Kenji776@gmail.com",
"createdDate": "5/01/2021",
"apiVersion": "50.0",
"logName": "log.txt",
"injectionVariablesFile": ["variables.json"]
}

Included is a basic apex script template you can copy and paste to make your own new scripts. It contains the placeholder for the variable injection, a basic email sending method so you can get the results of the script run and the required logging method so that information can be extracted from the debug log and printed cleanly. All your scripts should use that as a starting point if you want the logging and variable injection to work. You of course can add as many methods as you want but I suggest keeping your starting point as the init() method.

What's the variables.json file?
the varaibles.json is a file that contains key/value pairs that will be injected into your script at run-time. This is the best way I could find to provide information to your script that you might normally like to pass as command line arguments since you can't really do that with execute anonymous. In your variables.json file (you may have as many as you like, just comma separate the names in your config.JSON file) simply define the values you want to be available in your script (mostly useful if these values would be coming from another system or you want your script to be easily modifiable by others) and they will be injected into the runTimeVars map when your script is run. Remember that since it's a map of key/object you may have to cast your value or do some parsing to get it to behave the way you need it to in your script.

To see more about the project check out.

https://iwritecrappycode.wordpress.com/2021/04/07/salesforce-apex-script-loader/

