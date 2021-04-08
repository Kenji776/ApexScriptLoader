Apex Script Loader

What is it? 
Apex script loader is a node.js application run running execute anonymous apex scripts. It provdes a way to launch scripts via the terminal and provide configuration 
information to them at run time while providing quality logs. If you have daily processes you have to do that could be done via an apex script but your tired of having to log in and run it every day then this may be for you.

How to use it?
You must first have authorized the org you intended to run your script against using SFDX. In the scripts folder create a folder for your new script. It will contain two files, a JSON configuration file and the Apex script to run. To run your script
simply call it from the terminal by passing the name of your script folder as a parameter to the ApexScriptLoader.js file. EX

node ApexScriptLoader.js FixCases

where FixCases is the name of your script folder. In that folder the config file must be named config.json.

What goes in my Config.JSON file?
At the bare minimum you need the username that connects to the org you want to run the script against and the name of the file that contains the script.
The rest is optional. Here is an example of a bare minimum file

{
"apexScriptFile": "FixCases.apex",
"username": "Kenji776@mySalesforceOrg.com"
}

Here is one with more details, mostly useful if you intend to distribute your scripts so people can know what they are getting.

{
"apexScriptFile": "FixCases.apex",
"username": "Kenji776@mySalesforceOrg.com",
"apexResultFile": "executeResult.txt",
"applicationName": "Reprocess Unsynced Cases",
"description": "Node.js script that invokes an apex execute anonymous script using SFDX to update cases which did not sync properly. Changing the cases status forces reprocessing and hopefully propery syncing.",
"author": "Daniel Llewellyn / Kenji776@gmail.com",
"createdDate": "4/06/2010",
"apiVersion": "50.0",
"logName": "log.txt"
}

I wrote a blog about it that talks about the the variable injection works and I don't feel writing anymore so just read that.

https://iwritecrappycode.wordpress.com/2021/04/07/salesforce-apex-script-loader/