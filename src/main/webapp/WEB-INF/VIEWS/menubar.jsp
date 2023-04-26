<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>My Application</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
  <style type="text/css">
    .navbar-brand, .navbar-nav .nav-link {
        font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        font-size: 20px;
      color: rgb(0, 0, 0);
    }
    .navbar-brand:hover, .navbar-nav .nav-link:hover {
      color: rgb(236, 48, 101);
    }
  </style>
  
</head>
<body>

  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg" style="background-color: #cae6fa;">
  <a class="navbar-brand" style="color: purple; font-size: 30px; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">My Finance Manager</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="home">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="inc">Add Income</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="exp">Add Expense</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addcat">Add Category</a>
      </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           Update
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="updateinc">Update Income Category</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="updateexp">Update Expense Category</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="get">Update Income</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="updateexp2">Update Expense</a></li>
          </ul>
        </li>
       <li class="nav-item">
        <a class="nav-link" href="report">Report</a>
      </li>
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           Delete
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="delete">Delete Income - Expense</a></li>
             <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="deletecategory">Delete Category</a></li>
          </ul>
        </li>
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
           Show
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="showallinc">Income details</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="showallexp">Expense details</a></li>
          </ul>
        </li>
         <li class="nav-item">
        <a class="nav-link" href="logout" style="margin-left: 100px">Logout</a>
      </li>
    </ul>
  </div>
</nav>


  <!-- Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  

</body>
</html>
