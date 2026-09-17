<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container mt-4">

    <!-- ================================================= -->
    <!-- TITLE -->
    <!-- ================================================= -->

    <div class="d-flex justify-content-between align-items-center mb-3">

        <h2>QUẢN LÝ PRODUCT</h2>

        <button type="button"
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#addProductModal">

            + Thêm Product

        </button>

    </div>


    <!-- ================================================= -->
    <!-- PRODUCT TABLE -->
    <!-- ================================================= -->

    <div class="table-responsive">

        <table class="table table-bordered table-hover">

            <thead class="table-dark">

                <tr>

                    <th>ID</th>
                    <th>Tên Product</th>
                    <th>Image</th>
                    <th>Đơn giá</th>
                    <th>Discount</th>
                    <th>Quantity</th>
                    <th>Status</th>
                    <th>Category</th>
                    <th>Thao tác</th>

                </tr>

            </thead>


            <tbody id="productTableBody">

            </tbody>

        </table>

    </div>

</div>



<!-- ================================================= -->
<!-- ADD PRODUCT MODAL -->
<!-- ================================================= -->

<div class="modal fade"
     id="addProductModal"
     tabindex="-1">

    <div class="modal-dialog modal-lg">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Thêm Product
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <div class="modal-body">

                <form id="addProductForm">


                    <!-- Tên Product -->

                    <div class="mb-3">

                        <label class="form-label">
                            Tên Product
                        </label>

                        <input type="text"
                               class="form-control"
                               id="addProductName"
                               required>

                    </div>


                    <!-- Image -->

                    <div class="mb-3">

                        <label class="form-label">
                            Image
                        </label>

                        <input type="file"
                               class="form-control"
                               id="addProductImage"
                               accept="image/*">

                    </div>


                    <!-- Đơn giá -->

                    <div class="mb-3">

                        <label class="form-label">
                            Đơn giá
                        </label>

                        <input type="number"
                               step="0.01"
                               min="0"
                               class="form-control"
                               id="addProductUnitPrice"
                               required>

                    </div>


                    <!-- Discount -->

                    <div class="mb-3">

                        <label class="form-label">
                            Discount
                        </label>

                        <input type="number"
                               step="0.01"
                               min="0"
                               value="0"
                               class="form-control"
                               id="addProductDiscount">

                    </div>


                    <!-- Description -->

                    <div class="mb-3">

                        <label class="form-label">
                            Description
                        </label>

                        <textarea
                            class="form-control"
                            id="addProductDescription"
                            rows="3"></textarea>

                    </div>


                    <!-- Quantity -->

                    <div class="mb-3">

                        <label class="form-label">
                            Quantity
                        </label>

                        <input type="number"
                               min="0"
                               value="0"
                               class="form-control"
                               id="addProductQuantity"
                               required>

                    </div>


                    <!-- Status -->

                    <div class="mb-3">

                        <label class="form-label">
                            Status
                        </label>

                        <select class="form-select"
                                id="addProductStatus">

                            <option value="true">
                                Đang bán
                            </option>

                            <option value="false">
                                Ngừng bán
                            </option>

                        </select>

                    </div>


                    <!-- Category -->

                    <div class="mb-3">

                        <label class="form-label">
                            Category
                        </label>

                        <select class="form-select"
                                id="addProductCategory"
                                required>

                            <option value="">
                                -- Chọn Category --
                            </option>

                        </select>

                    </div>


                </form>

            </div>


            <div class="modal-footer">

                <button type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal">

                    Đóng

                </button>


                <button type="button"
                        class="btn btn-primary"
                        id="btnAddProduct">

                    Thêm

                </button>

            </div>

        </div>

    </div>

</div>



<!-- ================================================= -->
<!-- EDIT PRODUCT MODAL -->
<!-- ================================================= -->

<div class="modal fade"
     id="editProductModal"
     tabindex="-1">

    <div class="modal-dialog modal-lg">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Cập nhật Product
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <div class="modal-body">

                <form id="editProductForm">


                    <!-- ID -->

                    <input type="hidden"
                           id="editProductId">


                    <!-- Tên Product -->

                    <div class="mb-3">

                        <label class="form-label">
                            Tên Product
                        </label>

                        <input type="text"
                               class="form-control"
                               id="editProductName"
                               required>

                    </div>


                    <!-- Image mới -->

                    <div class="mb-3">

                        <label class="form-label">
                            Image mới
                        </label>

                        <input type="file"
                               class="form-control"
                               id="editProductImage"
                               accept="image/*">

                        <small class="text-muted">
                            Không chọn ảnh mới thì giữ nguyên ảnh cũ.
                        </small>

                    </div>


                    <!-- Image hiện tại -->

                    <div class="mb-3">

                        <label class="form-label">
                            Image hiện tại
                        </label>

                        <div id="currentProductImage">
                        </div>

                    </div>


                    <!-- Đơn giá -->

                    <div class="mb-3">

                        <label class="form-label">
                            Đơn giá
                        </label>

                        <input type="number"
                               step="0.01"
                               min="0"
                               class="form-control"
                               id="editProductUnitPrice"
                               required>

                    </div>


                    <!-- Discount -->

                    <div class="mb-3">

                        <label class="form-label">
                            Discount
                        </label>

                        <input type="number"
                               step="0.01"
                               min="0"
                               class="form-control"
                               id="editProductDiscount">

                    </div>


                    <!-- Description -->

                    <div class="mb-3">

                        <label class="form-label">
                            Description
                        </label>

                        <textarea
                            class="form-control"
                            id="editProductDescription"
                            rows="3"></textarea>

                    </div>


                    <!-- Quantity -->

                    <div class="mb-3">

                        <label class="form-label">
                            Quantity
                        </label>

                        <input type="number"
                               min="0"
                               class="form-control"
                               id="editProductQuantity"
                               required>

                    </div>


                    <!-- Status -->

                    <div class="mb-3">

                        <label class="form-label">
                            Status
                        </label>

                        <select class="form-select"
                                id="editProductStatus">

                            <option value="true">
                                Đang bán
                            </option>

                            <option value="false">
                                Ngừng bán
                            </option>

                        </select>

                    </div>


                    <!-- Category -->

                    <div class="mb-3">

                        <label class="form-label">
                            Category
                        </label>

                        <select class="form-select"
                                id="editProductCategory"
                                required>

                            <option value="">
                                -- Chọn Category --
                            </option>

                        </select>

                    </div>


                </form>

            </div>


            <div class="modal-footer">

                <button type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal">

                    Đóng

                </button>


                <button type="button"
                        class="btn btn-primary"
                        id="btnUpdateProduct">

                    Cập nhật

                </button>

            </div>

        </div>

    </div>

</div>



<!-- ================================================= -->
<!-- AJAX PRODUCT -->
<!-- ================================================= -->

<script>


/* ================================================= */
/* LOAD PRODUCTS */
/* ================================================= */

function loadProducts() {

    $.getJSON(

        contextPath + "/api/product",

        function(products) {

            $("#productTableBody").empty();


            $.each(
                products,

                function(index, product) {

                    var categoryName = "";


                    if (product.category != null) {

                        categoryName =
                            product.category.name || "";

                    }


                    var statusText = "";


                    if (product.status === true) {

                        statusText = "Đang bán";

                    } else {

                        statusText = "Ngừng bán";

                    }


                    var imageHtml = "";


                    if (product.image) {

                        imageHtml =
                            "<img src='"
                            + contextPath
                            + "/uploads/"
                            + product.image
                            + "' "
                            + "width='70' "
                            + "height='70' "
                            + "class='img-thumbnail'>";

                    } else {

                        imageHtml = "Không có";

                    }


                    var row = "";


                    row += "<tr id='product-"
                        + product.id
                        + "'>";


                    /* ID */

                    row += "<td>"
                        + product.id
                        + "</td>";


                    /* NAME */

                    row += "<td>"
                        + (product.name || "")
                        + "</td>";


                    /* IMAGE */

                    row += "<td>"
                        + imageHtml
                        + "</td>";


                    /* UNIT PRICE */

                    row += "<td>"
                        + (product.unitPrice || "")
                        + "</td>";


                    /* DISCOUNT */

                    row += "<td>"
                        + (product.discount || 0)
                        + "</td>";


                    /* QUANTITY */

                    row += "<td>"
                        + (product.quantity || 0)
                        + "</td>";


                    /* STATUS */

                    row += "<td>"
                        + statusText
                        + "</td>";


                    /* CATEGORY */

                    row += "<td>"
                        + categoryName
                        + "</td>";


                    /* ACTIONS */

                    row += "<td>";


                    row += "<button "
                        + "type='button' "
                        + "class='btn btn-warning "
                        + "btn-sm me-1' "
                        + "onclick='editProduct("
                        + product.id
                        + ")'>"
                        + "Sửa"
                        + "</button>";


                    row += "<button "
                        + "type='button' "
                        + "class='btn btn-danger "
                        + "btn-sm' "
                        + "onclick='deleteProduct("
                        + product.id
                        + ")'>"
                        + "Xóa"
                        + "</button>";


                    row += "</td>";

                    row += "</tr>";


                    $("#productTableBody")
                        .append(row);

                }

            );

        }

    ).fail(function(xhr) {

        console.log(xhr.responseText);

        alert(
            "Không thể tải danh sách Product!"
        );

    });

}



/* ================================================= */
/* LOAD CATEGORIES */
/* ================================================= */

function loadCategories() {

    $.getJSON(

        contextPath + "/api/category",

        function(categories) {

            $("#addProductCategory").empty();

            $("#editProductCategory").empty();


            var defaultOption =
                "<option value=''>"
                + "-- Chọn Category --"
                + "</option>";


            $("#addProductCategory")
                .append(defaultOption);

            $("#editProductCategory")
                .append(defaultOption);


            $.each(

                categories,

                function(index, category) {

                    var option =
                        "<option value='"
                        + category.id
                        + "'>"
                        + category.name
                        + "</option>";


                    $("#addProductCategory")
                        .append(option);

                    $("#editProductCategory")
                        .append(option);

                }

            );

        }

    ).fail(function(xhr) {

        console.log(xhr.responseText);

        alert(
            "Không thể tải danh sách Category!"
        );

    });

}



/* ================================================= */
/* ADD PRODUCT */
/* ================================================= */

$("#btnAddProduct").click(function() {


    /* Validate */

    if (!$("#addProductForm")[0]
            .checkValidity()) {

        $("#addProductForm")[0]
            .reportValidity();

        return;

    }


    var categoryId =
        $("#addProductCategory").val();


    if (categoryId === "") {

        alert(
            "Vui lòng chọn Category!"
        );

        return;

    }


    /* ================================================= */
    /* TẠO FORMDATA */
    /* ================================================= */

    var formData =
        new FormData();


    /* Product name */

    formData.append(
        "name",
        $("#addProductName").val()
    );


    /* Image */

    var imageFile =
        $("#addProductImage")[0].files[0];


    if (imageFile) {

        formData.append(
            "image",
            imageFile
        );

    }


    /* Unit price */

    formData.append(
        "unitPrice",
        $("#addProductUnitPrice").val()
    );


    /* Discount */

    formData.append(
        "discount",
        $("#addProductDiscount").val() || 0
    );


    /* Description */

    formData.append(
        "description",
        $("#addProductDescription").val()
    );


    /* Quantity */

    formData.append(
        "quantity",
        $("#addProductQuantity").val()
    );


    /* Status */

    formData.append(
        "status",
        $("#addProductStatus").val()
    );


    /* Category */

    formData.append(
        "categoryId",
        categoryId
    );


    /* ================================================= */
    /* AJAX POST */
    /* ================================================= */

    $.ajax({

        url:
            contextPath + "/api/product",

        type:
            "POST",

        data:
            formData,

        contentType:
            false,

        processData:
            false,


        success:
            function(response) {

                alert(
                    "Thêm Product thành công!"
                );


                var modalElement =
                    document.getElementById(
                        "addProductModal"
                    );


                var modal =
                    bootstrap.Modal.getInstance(
                        modalElement
                    );


                if (modal) {

                    modal.hide();

                }


                $("#addProductForm")[0]
                    .reset();


                loadProducts();

            },


        error:
            function(xhr) {

                console.log(
                    xhr.responseText
                );

                alert(
                    "Thêm Product thất bại!"
                );

            }

    });

});



/* ================================================= */
/* EDIT PRODUCT */
/* ================================================= */

function editProduct(id) {

    $.getJSON(

        contextPath
        + "/api/product/"
        + id,

        function(product) {


            $("#editProductId")
                .val(product.id);


            $("#editProductName")
                .val(product.name || "");


            /* Không thể set value cho file input */

            $("#editProductImage")
                .val("");


            /* Image hiện tại */

            if (product.image) {

                $("#currentProductImage")
                    .html(

                        "<img src='"
                        + contextPath
                        + "/uploads/"
                        + product.image
                        + "' "
                        + "width='100' "
                        + "height='100' "
                        + "class='img-thumbnail'>"

                    );

            } else {

                $("#currentProductImage")
                    .html("Không có ảnh");

            }


            $("#editProductUnitPrice")
                .val(product.unitPrice || "");


            $("#editProductDiscount")
                .val(product.discount || 0);


            $("#editProductDescription")
                .val(product.description || "");


            $("#editProductQuantity")
                .val(product.quantity || 0);


            $("#editProductStatus")
                .val(
                    product.status === true
                        ? "true"
                        : "false"
                );


            if (product.category != null) {

                $("#editProductCategory")
                    .val(product.category.id);

            } else {

                $("#editProductCategory")
                    .val("");

            }


            var modalElement =
                document.getElementById(
                    "editProductModal"
                );


            var modal =
                bootstrap.Modal
                    .getOrCreateInstance(
                        modalElement
                    );


            modal.show();

        }

    ).fail(function(xhr) {

        console.log(xhr.responseText);

        alert(
            "Không thể lấy thông tin Product!"
        );

    });

}



/* ================================================= */
/* UPDATE PRODUCT */
/* ================================================= */

$("#btnUpdateProduct").click(function() {


    /* Validate */

    if (!$("#editProductForm")[0]
            .checkValidity()) {

        $("#editProductForm")[0]
            .reportValidity();

        return;

    }


    var id =
        $("#editProductId").val();


    var categoryId =
        $("#editProductCategory").val();


    if (categoryId === "") {

        alert(
            "Vui lòng chọn Category!"
        );

        return;

    }


    /* ================================================= */
    /* TẠO FORMDATA */
    /* ================================================= */

    var formData =
        new FormData();


    /* Name */

    formData.append(
        "name",
        $("#editProductName").val()
    );


    /* Image mới */

    var imageFile =
        $("#editProductImage")[0].files[0];


    if (imageFile) {

        formData.append(
            "image",
            imageFile
        );

    }


    /* Unit price */

    formData.append(
        "unitPrice",
        $("#editProductUnitPrice").val()
    );


    /* Discount */

    formData.append(
        "discount",
        $("#editProductDiscount").val() || 0
    );


    /* Description */

    formData.append(
        "description",
        $("#editProductDescription").val()
    );


    /* Quantity */

    formData.append(
        "quantity",
        $("#editProductQuantity").val()
    );


    /* Status */

    formData.append(
        "status",
        $("#editProductStatus").val()
    );


    /* Category */

    formData.append(
        "categoryId",
        categoryId
    );


    /* ================================================= */
    /* AJAX PUT */
    /* ================================================= */

    $.ajax({

        url:
            contextPath
            + "/api/product/"
            + id,

        type:
            "PUT",

        data:
            formData,

        contentType:
            false,

        processData:
            false,


        success:
            function(response) {

                alert(
                    "Cập nhật Product thành công!"
                );


                var modalElement =
                    document.getElementById(
                        "editProductModal"
                    );


                var modal =
                    bootstrap.Modal.getInstance(
                        modalElement
                    );


                if (modal) {

                    modal.hide();

                }


                loadProducts();

            },


        error:
            function(xhr) {

                console.log(
                    xhr.responseText
                );

                alert(
                    "Cập nhật Product thất bại!"
                );

            }

    });

});



/* ================================================= */
/* DELETE PRODUCT */
/* ================================================= */

function deleteProduct(id) {

    if (!confirm(
        "Bạn có chắc muốn xóa Product này không?"
    )) {

        return;

    }


    $.ajax({

        url:
            contextPath
            + "/api/product/"
            + id,

        type:
            "DELETE",


        success:
            function(response) {

                alert(
                    "Xóa Product thành công!"
                );


                $("#product-" + id)
                    .remove();

            },


        error:
            function(xhr) {

                console.log(
                    xhr.responseText
                );


                if (xhr.status === 404) {

                    alert(
                        "Không tìm thấy Product!"
                    );

                } else {

                    alert(
                        "Xóa Product thất bại!"
                    );

                }

            }

    });

}



/* ================================================= */
/* DOCUMENT READY */
/* ================================================= */

$(document).ready(function() {

    loadProducts();

    loadCategories();

});

</script>