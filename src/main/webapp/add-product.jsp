<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Adding product</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="d-flex align-items-center justify-content-center my-3">
        <div class="card w-75">
            <div class="card-header">
                <div class="text-center fw-semibold fs-5">Adding a product</div>
            </div>
            <div class="card-body">
                <form action="product-servlet" method="post">
                    <div class="row mb-3">
                        <div class="col">
                            <input type="text" name="productName" class="form-control" placeholder="Enter product name"
                                   aria-label="Enter product name">
                        </div>
                        <div class="col">
                            <input type="number" name="productPrice" class="form-control" placeholder="Enter product price"
                                   aria-label="Enter product price">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <div class="d-flex align-items-center justify-content-center">
                                <a href="<%=request.getContextPath()%>" class="btn btn-sm btn-outline-warning px-4 me-3">Back</a>
                                <button type="submit" class="btn btn-sm btn-outline-success px-4">Add</button>
                            </div>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>

</div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
