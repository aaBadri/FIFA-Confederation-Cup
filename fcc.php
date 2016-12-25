<?php
$conn = new mysqli("localhost", "root", "121212", "ConfederationsCup");
?>
<!DOCTYPE html>
<html>
<head>
    <title>FIFA Confederations Cup</title>
    <meta charset="utf-8"/>
    <style>
        * {
            padding-left: 40px;
            padding-top: 40px;
            font-family: Tahoma;
            font-size: 14px;
            direction: ltr;

        }
        #contain{
            background-color: #b0e4ff;
            width: 900px;
            padding: 30px;
            padding-bottom: 50px;
        }
        @font-face {
            font-family: 'Blokk';
            src: url('./fonts/blokk/BLOKKRegular.eot');
            src: url('./fonts/blokk/BLOKKRegular.eot?#iefix') format('embedded-opentype'),
            url('./fonts/blokk/BLOKKRegular.woff') format('woff'),
            url('./fonts/blokk/BLOKKRegular.svg#BLOKKRegular') format('svg');
            font-weight: normal;
            font-style: normal;
        }

        .component {
            line-height: 1.5em;
            margin: 0 auto;
            padding: 2em 0 3em;
            width: 80%;
            max-width: 1000px;
            overflow: hidden;
        }

        .component .filler {
            font-family: "Blokk", Arial, sans-serif;
            color: #d3d3d3;
        }

        table {
            border-collapse: collapse;
            margin-bottom: 3em;
            width: 80%;
            background: #fff;
        }

        td, th {
            padding: 0.75em 1em;
            text-align: left;
        }

        td.err {
            background-color: #e992b9;
            color: #fff;
            font-size: 0.75em;
            text-align: center;
            line-height: 1;
        }

        th {
            background-color: #31bc86;
            font-weight: bold;
            color: #fff;
            white-space: nowrap;
        }

        tbody th {
            background-color: #2ea879;
        }

        tbody tr:nth-child(2n-1) {
            background-color: #b0e4ff;
            transition: all .125s ease-in-out;
        }

        tbody tr:hover {
            background-color: rgba(129, 208, 177, .3);
        }

        /* For appearance */

        .sticky-wrap {
            overflow-x: auto;
            overflow-y: hidden;
            position: relative;
            margin: 3em 0;
            width: 100%;
        }

        .sticky-wrap .sticky-thead,
        .sticky-wrap .sticky-col,
        .sticky-wrap .sticky-intersect {
            opacity: 0;
            position: absolute;
            top: 0;
            left: 0;
            transition: all .125s ease-in-out;
            z-index: 50;
            width: auto; /* Prevent table from stretching to full size */
        }

        .sticky-wrap .sticky-thead {
            box-shadow: 0 0.25em 0.1em -0.1em rgba(0, 0, 0, .125);
            z-index: 100;
            width: 100%; /* Force stretch */
        }

        .sticky-wrap .sticky-intersect {
            opacity: 1;
            z-index: 150;

        }

        .sticky-wrap .sticky-intersect th {
            background-color: #666;
            color: #eee;
        }

        .sticky-wrap td,
        .sticky-wrap th {
            box-sizing: border-box;
        }

        /* Not needed for sticky header/column functionality */
        td.user-name {
            text-transform: capitalize;
        }

        .sticky-wrap.overflow-y {
            overflow-y: auto;
            max-height: 50vh;
        }

        a {
            display: block;
            text-align: center;
            text-decoration: none;
            color: white;
            background-color: blue;
            transition-duration: 0.4s;
        }

        a:hover {
            background-color: #585b58;
        }

        ::-webkit-input-placeholder { /* Chrome */
            color: #072952;
            transition: opacity 250ms ease-in-out;
        }

        #queryPlace {
            display: inline-block;
            width: 600px;
            height: 100px;
            font-size: 15px;
            border: 1px solid #888;
            color: #350a69;
            margin: 20px auto;
            text-align: left;
            padding: 5px;
            font-family: Tahoma, sans-serif;
            background-color: #3CBEF2;
        }

        #playbtn {
            border-top: 1px solid #3cbef2;
            background: #3CBEF2;
            background: -webkit-gradient(linear, left top, left bottom, from(#3cbef2), to(#65a9d7));
            background: -webkit-linear-gradient(top, #3cbef2, #65a9d7);
            background: -moz-linear-gradient(top, #3cbef2, #65a9d7);
            background: -ms-linear-gradient(top, #3cbef2, #65a9d7);
            background: -o-linear-gradient(top, #3cbef2, #65a9d7);
            padding: 8.5px 17px;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            -webkit-box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
            -moz-box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
            box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
            text-shadow: rgba(0, 0, 0, .4) 0 1px 0;
            color: white;
            font-size: 15px;

            font-family: Georgia, serif;
            text-decoration: none;
            vertical-align: middle;
        }

        #playbtn:hover {
            border-top-color: #28597a;
            background: #32789e;
            color: #ccc;
        }

        #playbtn:active {
            border-top-color: #2f5ed6;
            background: #2f5ed6;
        }

        .addMatch {
            border-top: 1px solid #3cbef2;
            background: #3CBEF2;
            background: -webkit-gradient(linear, left top, left bottom, from(#3cbef2), to(#65a9d7));
            background: -webkit-linear-gradient(top, #3cbef2, #65a9d7);
            background: -moz-linear-gradient(top, #3cbef2, #65a9d7);
            background: -ms-linear-gradient(top, #3cbef2, #65a9d7);
            background: -o-linear-gradient(top, #3cbef2, #65a9d7);
            padding: 8.5px 17px;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            -webkit-box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
            -moz-box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
            box-shadow: rgba(0, 0, 0, 1) 0 1px 0;
            text-shadow: rgba(0, 0, 0, .4) 0 1px 0;
            color: white;
            font-size: 15px;

            font-family: Georgia, serif;
            text-decoration: none;
            vertical-align: middle;
        }

        .addMatch:hover {
            border-top-color: #28597a;
            background: #32789e;
            color: #ccc;
        }

        .addMatch:active {
            border-top-color: #2f5ed6;
            background: #2f5ed6;
        }

        .matchItem {
            display: inline-block;
            width: 100px;
            height: 30px;
            font-size: 15px;
            border: 1px solid #888;
            color: #020c1d;
            margin: 10px auto;
            margin-right: 33px;
            text-align: left;
            padding: 5px;
            font-family: Tahoma, sans-serif;
            background-color: #3CBEF2;
        }

        #players1, #players2 {
            width: 250px;

        }

        #qualifybtn {
            background-color: darkolivegreen;
        }
    </style>
</head>
<body>
<div id="contain">
<form action="fcc.php" method="post">
    <input type="text" id="queryPlace" name="queryPlace" placeholder="write your query here"/>
    <br/>
    <input type="submit" name="playbtn" id="playbtn" value="Play"/>
</form>
</div>
<?php
if (isset($_POST['playbtn'])) {
    $query = $_POST['queryPlace'];
//echo $query;
//$query = "SELECT * FROM Matches";
    $result = $conn->query($query);
    if ($result != false) {
        ?>
        <br/>
        <br/>
        <table>
        <?php
        echo '<tr>';
        while ($property = mysqli_fetch_field($result)) {
            echo '<th>' . $property->name . '<th/>';
        }
        echo '<tr/>';
        while ($row = $result->fetch_row()) {
            echo '<tr>';
            //foreach ($row as $item){
            for ($i = 0;
                 $i < sizeof($row);
                 $i++) {
                echo '<td>' . $row[$i] . '<td/>';
            }
            echo '<tr/>';
        }
    }
    ?>
    </table>
<?php }
?>

</body>
</html>