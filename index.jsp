<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JustCalculate</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #e0f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
            transition: background-color 0.3s;
        }
        h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #00796b;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        input {
            margin: 10px 0;
            padding: 15px;
            width: 220px;
            border: 2px solid #00796b;
            border-radius: 5px;
            font-size: 18px;
            transition: border-color 0.3s;
        }
        input:focus {
            border-color: #004d40;
            outline: none;
        }
        .button-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 10px;
        }
        button {
            margin: 5px;
            padding: 15px;
            width: 60px;
            border: none;
            border-radius: 5px;
            background-color: #00796b;
            color: white;
            font-size: 18px;
            opacity: 0.7; 
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        button:hover {
        
            background-color: #004d40;
            transform: scale(1.1);
        }
        #history {
            margin-top: 20px;
            font-size: 18px;
            color: #00796b;
            display: none; /* Initially hidden */
        }
        .b1{
        
        width: 40%;
        }
         .b2{
        
        width: 40%;
        }
        
        
    </style>
    <script>
        // Function to toggle the visibility of the history
        function toggleHistory() {
            var historySection = document.getElementById("history");
            if (historySection.style.display === "none") {
                historySection.style.display = "block";
            } else {
                historySection.style.display = "none";
            }
        }

        // Function to redirect to the home page
        function goHome() {
            window.location.href = "index.jsp";
        }
    </script>
</head>
<body>
<img src="Images/1.gif" alt="Calculator Image">
<h1>hello, it's your personal calculator</h1>

<form action="MyServlet" method="post">
    <input name="num1" id="num1" placeholder="Number 1" required></input>
    <input name="num2" id="num2" placeholder="Number 2" required></input><br>
    <div class="button-container">
        <button name="btn1" value="1">+</button>
        <button name="btn1" value="2">-</button>
        <button name="btn1" value="3"> * </button>
        <button name="btn1" value="4">/</button>
    </div>
</form>

<h1>Ans is : <%= request.getParameter("ans") %></h1>

<!-- Show History Button -->
<button class = "b2" onclick="toggleHistory()">Show History</button>

<!-- Home Button -->
 
<!-- Display calculation history -->
<div id="history">
    <h2>Calculation History:</h2>
    <ul>
        <%
            // Retrieve history from the session
            ArrayList<String> history = (ArrayList<String>) session.getAttribute("history");
            if (history != null && !history.isEmpty()) {
                for (String entry : history) {
        %>
                    <li><%= entry %></li>
        <%
                }
            } else {
        %>
                <li>No history yet.</li>
        <%
            }
        %>
    </ul>
</div>

</body>
</html>
