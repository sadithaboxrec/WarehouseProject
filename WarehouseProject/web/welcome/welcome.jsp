<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alexander Store - Warehouse</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <style href="welcome.css" rel="stylesheet"></style>
</head>
<body class="bg-gray-100">
    <header class="bg-blue-600 text-white py-4 md:py-6">
        <div class="container mx-auto px-4 flex justify-between items-center">
            <h1 class="text-xl md:text-2xl font-semibold">Alexander Store - Warehouse</h1>
        </div>
    </header>

    <section id="home" class="bg-gradient-to-br from-blue-100 to-purple-100 text-gray-800 py-16 md:py-14 px-4">
        <div class="container mx-auto text-center">
            <h2 class="text-3xl md:text-4xl font-bold mb-4"> Toys Distribution Warehouse </h2>
            <p class="text-lg md:text-xl mb-8">" Toys, Smiles, and Magic in Every Aisle! "</p>
        </div>
    </section>

    <section id="services" class="bg-gray-100 py-16 md:py-14 px-4">
        <div class="container mx-auto text-center">
            <h2 class="text-2xl md:text-3xl font-semibold mb-8 text-blue-700">Analyzis</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div class="bg-white rounded-lg shadow-md p-6 w-full max-w-sm">
                    <h2 class="text-lg font-semibold text-gray-700 mb-4">Total Products</h2>
                    <div class="text-2xl font-bold text-gray-800"> ${totalProducts}</div>
                    
                </div>
                <div class="bg-white rounded-lg shadow-md p-6 w-full max-w-sm">
                    <h2 class="text-lg font-semibold text-gray-700 mb-4">Product amount with Low Stocks</h2>
                    <div class="text-2xl font-bold text-gray-800">${lowStock}</div>
                    
                </div>
                <div class="bg-white rounded-lg shadow-md p-6 w-full max-w-sm">
                    <h2 class="text-lg font-semibold text-gray-700 mb-4">Active Categories</h2>
                    <div class="text-2xl font-bold text-gray-800">${activeCategories}</div>
                    
                </div>
                <div class="bg-white rounded-lg shadow-md p-6 w-full max-w-sm">
                    <h2 class="text-lg font-semibold text-gray-700 mb-4">Orders not yet received</h2>
                    <div class="text-2xl font-bold text-gray-800">${incompleteOrders}</div>
                    
                </div>
                <div class="bg-white rounded-lg shadow-md p-6 w-full max-w-sm">
                    <h2 class="text-lg font-semibold text-gray-700 mb-4">Dispatch not completd yet</h2>
                    <div class="text-2xl font-bold text-gray-800">${unshippedDispatches}</div>
    
                </div>
                <div class="bg-white rounded-lg shadow-md p-6 w-full max-w-sm">
                    <h2 class="text-lg font-semibold text-gray-700 mb-4">Total Suppliers</h2>
                    <div class="text-2xl font-bold text-gray-800">${suppliers}</div>
    
                </div>
                    
            </div>
        </div>
    </section>
    
        <section id="Low Stocks" class="bg-gray-100 py-16 md:py-24 px-4">
            <div class="container mx-auto bg-100 text-center">
                <h2 class="text-2xl md:text-3xl font-semibold mb-8 text-blue-700">Products with Stock Below 100</h2>
                <div class="mx-auto max-w-3xl bg-white rounded-lg shadow-md overflow-hidden">
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-blue-600">
                <tr>
                    <th scope="col" class="px-6 py-3 text-center text-lg font-medium text-white uppercase tracking-wider">
                        Product Name
                    </th>
                    <th scope="col" class="px-6 py-3 text-center text-lg font-medium text-white uppercase tracking-wider">
                        Stock
                    </th>
                    <th scope="col" class="px-6 py-3 text-center text-lg font-medium text-white uppercase tracking-wider">
                        Supplier
                    </th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-200">
                <c:forEach var="product" items="${lowStockProducts}">
                <tr>
                    <td class="px-6 py-4 whitespace-nowrap text-base font-medium text-gray-900">
                        ${product.pro_name}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-base text-gray-700">
                        ${product.pro_stock}
                    </td>
                    <td class="px-6 py-4 whitespace-nowrap text-base text-gray-700">
                        ${product.suppName}
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
            </div>

    </section>

    <section id="about" class="bg-gray-100 py-16 md:py-24 px-4">
        <div class="container mx-auto md:flex justify-center items-center gap-12">
            <div class="md:w-1/2">
                <h2 class="text-2xl md:text-3xl font-semibold mb-4 text-blue-700">About Us</h2>
                <p class="text-gray-600 text-lg">
                    Founded in 2021, Alexander Store is a passionate startup toy shop dedicated to delivering high-quality toys that spark joy, creativity, and nostalgia across all age groups — 
                    from toddlers to the young at heart. Our mission is simple yet powerful: to bring smiles to faces of every generation through thoughtfully curated toys that inspire play, 
                    connection, and lifelong memories
                </p>
            </div>
        </div>
    </section>

    <footer class="bg-gray-800 text-white py-6">
        <div class="container mx-auto text-center">
            <p>© 2025 Alexander Store - Warehouse. All rights reserved.</p>
        </div>
    </footer>
    <script src="welcome.js"></script>
</body>
</html>
