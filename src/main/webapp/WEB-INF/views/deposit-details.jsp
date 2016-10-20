<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
	On this page we list all the deposits for a particular goal as well as the Total for all of the deposits.
	
	Model:
	- List<Deposit> getDepositsByGoal(Int goalId);
	- Int goalID is the numeric goal number automatically incremented when a new goal is added
	- String goal  if the page is filtered to a specific goal, this will
	                   be the name of that goal. Otherwise it will not be
	                   defined.
 --%>

<html>
<head>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		packages : [ 'corechart', 'line' ]
	});
	google.charts.setOnLoadCallback(drawAxisTickColors);

	function drawAxisTickColors() {
		var data = new google.visualization.DataTable();
		data.addColumn('date', 'Time of Day');
		data.addColumn('number', 'Goal-Projected Progress');
		data.addColumn('number', 'Goal-Actual Progress');

		data.addRows([ [ new Date(2016, 1, 1), 0, 0 ],
				[ new Date(2016, 1, 7), 10, 5 ],
				[ new Date(2016, 2, 3), 20, 15 ],
				[ new Date(2016, 2, 10), 27, 19 ],
				[ new Date(2016, 2, 17), 38, 30 ],
				[ new Date(2016, 2, 24), 49, 35 ], ]);

		var options = {
			hAxis : {
				title : 'Time',
				textStyle : {
					color : '#01579b',
					fontSize : 20,
					fontName : 'Arial',
					bold : true,
					italic : true
				},
				titleTextStyle : {
					color : '#01579b',
					fontSize : 16,
					fontName : 'Arial',
					bold : false,
					italic : true
				}
			},
			vAxis : {
				title : 'Goal',
				textStyle : {
					color : '#1a237e',
					fontSize : 24,
					bold : true
				},
				titleTextStyle : {
					color : '#1a237e',
					fontSize : 24,
					bold : true
				}
			},
			colors : [ '#a52714', '#097138' ]
		};
		var chart = new google.visualization.LineChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>

</head>
<body>
	<div id="chart_div" style="width: 900px; height: 500px"></div>

	<h4>
		<a href="<c:url value="/deposit-details"/>">Deposit Details</a> <a
			href="<c:url value="/goalsdashboard"/>">Back to the Dashboard</a>
	</h4>

	<%--<%@ "autogenerated --><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>--%>

	<%@ include file="head.jsp"%>
</head>
<body>

	<div>
		<table>			
	<%--		<tr> <c:out value= "${ depositDao.getAllDeposits()}"/></tr>
			<c:forEach var="deposit" items="${deposits}">
				<tr>
					<td><a href="<c:url value="/deposits/${deposit.depositId}"/>">

						<c:out value="${ depositDao.depositAmount }" /></a></td>
							
					<td><c:out value="${ depositDao.currentDate }" /> 
						<a href="<c:url value="/deposits?date=${deposit.currentDate}"/>">(filter)</a></td>
					


				</tr>
			</c:forEach>
		</table>
	</div>--%>


	<div>
		<h2>Total Deposits</h2>
		<c:out value="${depositAmount}" />
	</div>

	<form method="post">
		<div>
			<label>Deposit Amount:</label> <input type="text"
				name="depositAmount" value="${depositDao.depositAmount}" />
		</div>

		<button type="submit">Submit</button>
	</form>
	<div class="nav">
		<a href="<c:url value="/"/>">Home</a>
	</div>


</body>
</html>
