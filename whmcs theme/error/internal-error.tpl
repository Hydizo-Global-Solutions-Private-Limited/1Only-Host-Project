<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Oops!</title>
    <style>
        body {
            margin: 30px 40px;
            background-color: #02040a;
            color: #e2e8f0;
            font-family: 'Outfit', 'Helvetica Neue', Helvetica, Arial, sans-serif;
        }
        .error-container {
            padding: 50px 40px;
            border: 1px solid rgba(255, 158, 0, 0.2);
            border-radius: 16px;
            background: rgba(9, 13, 30, 0.65);
            backdrop-filter: blur(20px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.5);
            max-width: 800px;
            margin: 0 auto;
        }
        h1 {
            margin: 0;
            font-size: 48px;
            font-weight: 800;
            color: #ffffff;
            background: linear-gradient(135deg, #ff9e00 0%, #ff007f 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        h2 {
            margin: 20px 0 10px 0;
            font-size: 26px;
            font-weight: 600;
            color: #ffffff;
        }
        a {
            color: #ff9e00;
            text-decoration: none;
            font-weight: 600;
        }
        a:hover {
            color: #ff7b00;
        }
        p.back-to-home {
            margin-top: 30px;
        }
        p.debug{
            padding: 20px;
            background: rgba(2, 4, 10, 0.5);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 8px;
            font-family: "Courier New", Courier, monospace, serif;
            font-size: 14px;
            color: #ef4444;
        }
        .info {
            border: solid 1px rgba(255, 158, 0, 0.3);
            padding: 10px;
            background-color: rgba(255, 158, 0, 0.1);
            color: #ff9e00;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>Oops!</h1>
    <h2>Something went wrong and we couldn't process your request.</h2>
    <p>Please go back to the previous page and try again.</p>
    <p>If the problem persists, please <a href="mailto:{{email}}">contact us</a>.</p>
    <p class="back-to-home"><a href="{{systemurl}}">&laquo; Back to Homepage</a></p>
    {{environmentIssues}}
    <p class="debug">{{adminHelp}}<br/>{{stacktrace}}</p>
</div>
</body>
</html>