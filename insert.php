<?php
$conn = new mysqli("localhost","root","","university");
$conn->set_charset("utf8");
?>
<!DOCTYPE html>
<html style="direction: rtl">
<head>
    <title>ثبت دانشجوی جدید</title>
    <meta charset="utf-8" />
    <style>
        * {
            font-family: Tahoma;
            font-size: 14px;
        }
    </style>
</head>
<body>
<form action="main.php?insert=1" method="post">
    <table>
        <tr>
            <td>نام</td>
            <td><input type="text" name="FName" /></td>
        </tr>
        <tr>
            <td>نام خانوادگی</td>
            <td><input type="text" name="LName" /></td>
        </tr>
        <tr>
            <td>وضعیت</td>
            <td>
                <select name="Status">
                    <option value="1">عادی</option>
                    <option value="2">مشروط</option>
                    <option value="3">اخراج</option>
                    <option value="4">مهمان</option>
                    <option value="5">فارغ‌التحصیل</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>رشته‌ی تحصیلی</td>
            <td>
                <select name="Field">
                <?php
                $result = $conn->query("SELECT * FROM fields");
                while($row = $result->fetch_assoc()){
                ?>
                    <option value="<?php echo $row['FieldID'] ?>"><?php echo $row['FieldName'] ?></option>
                <?php
                }
                ?>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center;">
                <input type="submit" value="ثبت دانشجو" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>