<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Temperature Converter</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #83a4d4, #b6fbff);
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background-color: white;
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0,0,0,0.2);
        width: 100%;
        max-width: 400px;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin: 8px 0 16px 0;
        border: 1px solid #ccc;
        border-radius: 8px;
    }

    input[type="radio"] {
        margin: 0 8px 0 0;
    }

    .unit-label {
        margin-right: 16px;
        font-weight: 500;
    }

    input[type="submit"] {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        transition: 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    .result {
        margin-top: 20px;
        background-color: #f9f9f9;
        padding: 15px;
        border-radius: 10px;
        text-align: center;
        font-size: 18px;
    }

    .error {
        color: red;
        font-size: 14px;
        text-align: center;
        margin-bottom: 10px;
    }

    @media (max-width: 500px) {
        .container {
            padding: 20px;
        }
    }
</style>
</head>
<body>
<div class="container">
    <h2>Temperature Converter</h2>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error">${error}</div>
    <% } %>

    <form action="convert" method="post">
        <label>Enter Temperature:</label>
        <input type="text" name="temperature" required>

        <label>Select Unit:</label><br>
        <label class="unit-label"><input type="radio" name="unit" value="C" checked> Celsius</label>
        <label class="unit-label"><input type="radio" name="unit" value="F"> Fahrenheit</label>

        <br><br>
        <input type="submit" value="Convert">
    </form>

    <% if (request.getAttribute("result") != null) { %>
        <div class="result">
            <p><strong>Input:</strong> ${input} ${inputUnit}</p>
            <p><strong>Converted:</strong> ${result} ${resultUnit}</p>
        </div>
        <% } %>
</div>
</body>
</html>
