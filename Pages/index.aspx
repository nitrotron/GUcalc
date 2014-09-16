<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="GuCalc.Pages.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GUcalc</title>
    <link href="../Content/jquery.mobile-1.4.2.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.8.3.min.js"></script>
    <script src="../Scripts/jquery.mobile-1.4.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Start of first page -->
            <div data-role="page" id="foo">

                <div data-role="header">
                    <h1>Foo</h1>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <p>I'm first in the source order so I'm shown as the page.</p>
                    <p>View internal page called <a href="#bar">bar</a></p>

                    <a href="#bar" class="ui-btn ui-btn-a" data-transition="slide">BAR</a>
                   
                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4>Page Footer</h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->

            <!-- Start of second page -->
            <div data-role="page" id="bar">

                <div data-role="header">
                    <h1>Bar</h1>
                </div>
                <!-- /header -->

                <div role="main" class="ui-content">
                    <p>I'm the second in the source order so I'm hidden when the page loads. I'm just shown if a link that references my id is beeing clicked.</p>
                    <p><a href="#foo"  data-transition="slide" data-direction="reverse">Back to foo</a></p>
                </div>
                <!-- /content -->

                <div data-role="footer">
                    <h4>Page Footer</h4>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page -->
        </div>
    </form>

    <script type="text/javascript">
        
       
        
    </script>

</body>
</html>
