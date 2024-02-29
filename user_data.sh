#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
PUBLIC_IP=$(curl -s ifconfig.me)
echo "<!DOCTYPE html>
<html lang='en'>
<head>
  <meta charset='UTF-8'>
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  <title>Website</title>
  <style>
    body, html {
        background: #252527;
        height: 100%;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .owText {
        text-align: center;
        -webkit-text-stroke: 2px white;
        position: relative;
        text-transform: uppercase;
        color: #252527;
        font-size: 5vw;
        letter-spacing: 0.4vw;
        font-weight: 700;
        text-shadow:

        0 1px 0 #4a4a4e,
        -1px -1px 0 #4a4a4e,

        /*main 3d shadow*/
        -1px 0px 0 #343437,
        -2px 1px 0 #343437,
        -3px 2px 0 #313134,
        -4px 3px 0 #2f2f31,
        -5px 4px 0 #2c2c2f,
        -6px 5px 0 #2a2a2c,
        -7px 6px 0 #27272a,
        -8px 7px 0 #252527,
        -9px 8px 0 #232324,

        /*top right*/
        0 -1px 1px white,
        0 -2px 0px white,

        /*bottom left corner*/
        -9px 8px 0px white,
        -10px 9px 0px white,
        -11px 10px 0px white,
        -12px 11px 0px white,
        -2px -1px 0 white,
        -3px 0px 0 white,

        /*top left corner*/
        -13px 9px 0 white,
        -12px 8px 0 white,
        -11px 7px 0 white,
        -10px 6px 0 white,
        -9px 5px 0 white,
        -8px 4px 0 white,
        -7px 3px 0 white,
        -6px 2px 0 white,
        -5px 1px 0 white,
        -4px 0px 0 white,

        /*lower right / (upper right side for capital T like H etc letters. */
        0px 2px 0px white,
        -1px 3px 0px white,
        -2px 4px 0px white,
        -3px 5px 0px white,
        -4px 6px 0px white,
        -5px 7px 0px white,
        -6px 8px 0px white,
        -7px 9px 0px white,
        -8px 10px 0px white,
        -9px 11px 0px white;
    }
  </style>
</head>
<body>
  <div class='owText'>instance ip: $PUBLIC_IP</div>
</body>
</html>" | sudo tee /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd