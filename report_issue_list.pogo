#
#
#

report_issue_list

p_person integer 0
p_type integer 0

<?

	r record;

?><%

%>

<%= psp_layout_header('p_title=Report Issue List&p_page=list', CU) %>

    <div class="container">

        <div class="panel panel-default">
            <div class="panel-heading">
                <strong>CUSTOMER SUPPORT - ISSUE LIST</strong>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Feedback</th>
                        <th>Rating</th>
                    </tr>
                </thead>
                <tbody>
            <%

            	for r in
            	(
            		select f.*, sp.name as sp_name, qt.name as qt_name
            		from feedback_json f, LU_support_people sp, LU_question_types qt
            		where f.person_id = sp.id
            		and f.question_type = qt.id
            		and (p_person = 0 or f.person_id = p_person)
            		and (p_type = 0 or f.question_type = p_type)
            		order by rating_id, created_at
            	)
            	loop
            %>
            	<tr>
            		<td><%= r.sp_name %></td>
            		<td><%= r.qt_name %></td>
            		<td><%= r.json_extras ->> 'comment' %></td>
            		<td><span class="badge" style="background-color:<%= case r.rating_id when 100 then '#2ecc71' when 50 then '#EB9532' else '#D64541' end %>;"><%= r.rating_id %>% </span></td>
            	</tr>

            <%
            	end loop;

            %>
            </tbody>
            </table>
        </div>
        <!-- .panel -->

    </div>
    <!-- .container -->

</body>

</html>