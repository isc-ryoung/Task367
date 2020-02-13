Class MyService.MyServiceSoap Extends %SOAP.WebClient [ ProcedureBlock ]
{
/// Instance IRISx2020x2x0Lx142x0
/// Namespace USER
///
/// Testing the Service from Terminal
/*
 
 Set client=##class(MyService.MyServiceSoap).%New()
 Write client.Test(2, 3)

*/  

/// Output from test
/*  
  02/13/2020 11:41:23 *********************
Output from Web client with SOAP action = http://tempuri.org/MyApp.MyService.Test
<?xml version="1.0" encoding="UTF-8" ?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:s='http://www.w3.org/2001/XMLSchema'>
  <SOAP-ENV:Body><Test xmlns="http://tempuri.org"><first xsi:type="s:long">2</first><second xsi:type="s:long">3</second></Test></SOAP-ENV:Body>
</SOAP-ENV:Envelope>


02/13/2020 11:41:24 *********************
Input to Web client with SOAP action = http://tempuri.org/MyApp.MyService.Test
<?xml version="1.0" encoding="UTF-8" ?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:s='http://www.w3.org/2001/XMLSchema'>
  <SOAP-ENV:Body><TestResponse xmlns="http://tempuri.org"><TestResult>5</TestResult></TestResponse></SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  
*/

/// This is the URL used to access the web service.
Parameter LOCATION = "http://172.17.208.23:52773/csp/user/MyApp.MyService.cls";

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://tempuri.org";

/// Use xsi:type attribute for literal types.
Parameter OUTPUTTYPEATTRIBUTE = 1;

/// Determines handling of Security header.
Parameter SECURITYIN = "ALLOW";

/// This is the name of the Service
Parameter SERVICENAME = "MyService";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

Method Test(first As %Integer, second As %Integer) As %Integer [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("Test").Invoke($this,"http://tempuri.org/MyApp.MyService.Test",.first,.second)
}

}
