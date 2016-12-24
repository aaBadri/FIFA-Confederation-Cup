<?php
$conn = new mysqli("localhost","root","","university");
$conn->set_charset("utf8");
if(!isset($_GET['update']))
    die("You must set a student number.");
$result = $conn->query("SELECT * FROM students WHERE `Number` = {$_GET['update']}");
$student = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html style="direction: rtl">
<head>
    <title>اصلاح</title>
    <meta charset="utf-8" />
    <style>
        * {
            font-family: Tahoma;
            font-size: 14px;
        }
    </style>
</head>
<body>
<form action="main.php?update=<?php echo $student['Number'] ?>" method="post">
    <table>
        <tr>
            <td>نام</td>
            <td><input type="text" name="FName" value="<?php echo $student['FName'] ?>" /></td>
        </tr>
        <tr>
            <td>نام خانوادگی</td>
            <td><input type="text" name="LName" value="<?php echo $student['LName'] ?>" /></td>
        </tr>
        <tr>
            <td>وضعیت</td>
            <td>
                <?php
                for($i=1;$i<=5;$i++){
                    if($i == $student['Status'])
                        $select[$i] = "selected";
                    else
                        $select[$i] = "";
                }
                ?>
                <select name="Status">
                    <option <?php echo $select[1] ?> value="1">عادی</option>
                    <option <?php echo $select[2] ?> value="2">مشروط</option>
                    <option <?php echo $select[3] ?> value="3">اخراج</option>
                    <option <?php echo $select[4] ?> value="4">مهمان</option>
                    <option <?php echo $select[5] ?> value="5">فارغ‌التحصیل</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>رشته‌ی تحصیلی</td>
            <td>
                <select name="Field">
                    <?php
                    for($i=1;$i<=4;$i++){
                        if($i == $student['Field'])
                            $select[$i] = "selected";
                        else
                            $select[$i] = "";
                    }
                    $i = 1;
                    $result = $conn->query("SELECT * FROM fields");
                    while($row = $result->fetch_assoc()){
                        echo '<option '.$select[$i].' value="'.$row['FieldID'].'">'.$row['FieldName'].'</option>';
                        $i++;
                    }
                    ?>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="submit" value="اصلاح اطلاعات" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>