#
#
#

report_4d_graph

p_player integer 0
p_match integer 0

<?
	r record;
	t record;

	svg_box integer := 1000;
	svg_radius integer;
	rgb_green integer := 100;

?><%

%>
<%= psp_layout_header('p_title=Report Graph&p_page=graph', CU) %>

	<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th>Name \ Type</th>

<%
		for r in
		(
			select *
			from LU_question_types
			order by name, id
		)
		loop

%>
			<th><%= r.name %></th>
<%
		end loop;

%>
			</tr>
		</thead>
		<tbody>
<%
	for r in
	(
		select * from LU_support_people
		order by name
	)
	loop

%>
		<tr>
			<th><%= r.name %></th>
<%

		for t in
		(
			with w as
			(
				select
					question_type,
					count(1) as qty,
					sum(rating_id) as rating
				from feedback_json f
				where f.person_id = r.id
				group by f.question_type
			)
			select w.*, lu.name as lu_name, lu.id as lu_id
			from LU_question_types lu
				left outer join w
					on lu.id = w.question_type
			order by lu_name, lu_id
		)
		loop

			if t.qty is null then

%>
				<td><span>&nbsp;</span></td>

<%
			else

				svg_radius := t.qty * 10;
				if svg_radius > svg_box * 0.4 then svg_radius := (svg_box * 0.4) :: integer; end if;
				if svg_radius < svg_box * 0.1 then svg_radius := (svg_box * 0.1) :: integer; end if;

				rgb_green := (case when t.rating / t.qty < 90.0 then 0 else 255 - 25 * (100 - t.rating / t.qty) end) :: integer;

%>
			<td>
				<span><%= to_char(t.rating / t.qty, '990') %>% </span>
				<span>
					<a href="report_issue_list?p_person=<%= r.id %>&p_type=<%= t.question_type %>">
						<svg viewBox="0 0 <%= svg_box %> <%= svg_box %>" >

							<circle cx="<%= svg_box / 2 %>" cy="<%= svg_box / 2 %>" r="<%= svg_radius %>" fill="rgb(<%= 255-rgb_green %>,<%= rgb_green %>,0)" />

						</svg>
					</a>
				</span>
			</td>

<%
		end if; /* t.qty */

	end loop; /* t */
%>

	</tr>
<%

	end loop; /* people */

%>
	</tbody>
</table>

</body>

</html>

