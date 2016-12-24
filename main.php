<?php
$conn = new mysqli("localhost","root","","university");
$conn->set_charset("utf8");
if(isset($_GET['delete'])){
    $result = $conn->query("DELETE FROM students WHERE `Number` = {$_GET['delete']}");
    $query = "SELECT * FROM students";
    $result = $conn->query($query);
}else if(isset($_GET['insert'])){
    $fname = $_POST['FName'];
    $lname = $_POST['LName'];
    $status = $_POST['Status'];
    $field = $_POST['Field'];
    $query = "INSERT INTO students (FName,LName,`Status`,Field)
     VALUES('$fname','$lname',$status,$field)";
    $conn->query($query);
    $query = "SELECT * FROM students";
    $result = $conn->query($query);
}else if(isset($_GET['update'])){
    $fname = $_POST['FName'];
    $lname = $_POST['LName'];
    $status = $_POST['Status'];
    $field = $_POST['Field'];
    $query = "UPDATE students SET FName = '$fname' , LName = '$lname' ,
     `Status` = $status , Field = $field WHERE `Number` = {$_GET['update']}";
    $conn->query($query);
    $query = "SELECT * FROM students";
    $result = $conn->query($query);
}else if(isset($_GET['search'])){
    $search = $_GET['search'];
    $query = "SELECT * FROM students WHERE FName LIKE '%$search%' OR LName LIKE '%$search%'";
    $result = $conn->query($query);
}else{
    $query = "SELECT * FROM students";
    $result = $conn->query($query);
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>نمایش اطلاعات</title>
    <meta charset="utf-8" />
    <style>
        *{
            font-family: Tahoma;
            font-size: 14px;
            direction: rtl;
        }
        table{
            border:1px black solid;
            border-collapse:collapse;
        }
        th{
            width:120px;
            padding:5px;
            border:1px black solid;
        }
        td{
            border:1px black solid;
            padding: 5px;
            text-align: center;
        }
        a{
            display: block;
            text-align: center;
            text-decoration: none;
            color: white;
            background-color: blue;
            transition-duration: 0.4s;
        }
        .insert{
            width: 180px;
            height: 25px;
            padding: 10px;
            margin: 10px;
            font-size: 16px;
            font-weight: 600;
            float: right;
        }
        a:hover{
            background-color: darkslateblue;
        }
        .updel{
            width: 40px;
            height: 20px;
            padding: 5px;
            margin: 5px;
            float: right;
            font-weight: 600;
        }
        form{
            display: block;
            margin: 10px;
        }
        .search{
            height: 30px;
            width: 180px;
            font-size: 16px;
        }
        .button{
            text-align: center;
            text-decoration: none;
            color: white;
            background-color: blue;
            font-size: 16px;
            font-weight: 600;
            border: none;
            height: 35px;
        }
        .button:hover{
            background-color: darkslateblue;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>شماره دانشجویی</th>
        <th>نام</th>
        <th>نام خانوادگی</th>
        <th>وضعیت</th>
        <th>رشته‌ی تحصیلی</th>
        <th>علمیات</th>
    </tr>
    <?php
    while($row = $result->fetch_assoc()){
    ?>
    <tr>
        <td><?php echo $row['Number'] ?></td>
        <td><?php echo $row['FName'] ?></td>
        <td><?php echo $row['LName'] ?></td>
        <td><?php
            $status = $row['Status'];
            $result2 = $conn->query("SELECT * FROM status WHERE StatusID = $status");
            $row2 = $result2->fetch_assoc();
            echo $row2['StatusName'];
            ?></td>
        <td><?php
            $field = $row['Field'];
            $result3 = $conn->query("SELECT * FROM fields WHERE FieldID = $field");
            $row3 = $result3->fetch_assoc();
            echo $row3['FieldName'];
            ?></td>
        <td>
            <a href="main.php?delete=<?php echo $row['Number']; ?>" class="updel">حذف</a>
            <a href="update.php?update=<?php echo $row['Number']; ?>" class="updel">اصلاح</a>
        </td>
    </tr>
    <?php
    }
    ?>
</table>
<form action="main.php" method="get">
    <input type="search" name="search" class="search" />
    <input type="submit" class="button" value="جستجو" />
</form>
<a href="insert.php" class="insert">
    ثبت دانشجوی جدید
</a>
</body>
</html>