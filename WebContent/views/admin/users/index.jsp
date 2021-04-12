<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<meta charset="UTF-8">
<title>QL User</title>
</head>
<body>
<div class="col-8 offset-2">
  <div class="mt-5 row">
    <div class="col-6">
      <button class="btn btn-success">Thêm mới</button>
    </div>
    <div class="col-4"></div>
    <div class="col-2 d-flex justify-content-end">
      <select class="form-select">
        <option value="10" selected>10</option>
        <option value="10">20</option>
        <option value="10">50</option>
        <option value="10">100</option>
      </select>
    </div>
  </div>
  <div class="mt-5 table-responsive">
    <table class="table table-striped">
      <thead>
        <tr>
          <td>Id</td>
          <td>Name</td>
          <td>Email</td>
          <td>Gender</td>
          <td>Role</td>
          <td colspan="2">Action</td>
        </tr>
      </thead>
      <tbody>
      	<c:forEach items="${ listUser }" var="user">
      		<tr>
	          <td>${ user.id }</td>
	          <td>${ user.name }</td>
	          <td>${ user.email }</td>
	          <td>${ user.gender }</td>
	          <td>${ user.role }</td>
	          <td>
	            <a
	            	href="/PT15302UD/admin/users/update?id=${ user.id }"
	            	class="btn btn-primary">Update</a>
	          </td>
	          <td>
	            <a
	            	href="/PT15302UD/admin/users/delete?id=${ user.id }"
	            	class="btn btn-danger">Delete</a>
	          </td>
	        </tr>
      	</c:forEach>
      </tbody>
    </table>
    
    <div>
    	<ul class="pagination">
    		<li class="page-item">
    			<a href="/PT15302UD/admin/users?page=${ page - 1 }"
    				class="page-link">Previous</a>
    		</li>
    		<li class="page-item">
    			<a class="page-link">${ page }</a>
    		</li>
    		<li class="page-item">
    			<a href="/PT15302UD/admin/users?page=${ page + 1 }"
    				class="page-link">Next</a>
    		</li>
    	</ul>
    </div>
  </div>
</div>
</body>
</html>