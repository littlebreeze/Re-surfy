<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/resources/css/footer.css" rel="stylesheet">
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/resources/js/scripts.js"></script> 

        <footer class="p-3 mb-2 text-white" style="background-color: #ff7851">
            <div class="container"><br><p class="m-0 text-center text-white">Copyright &copy; Resurfy 2023</p>
            <br>
            <a href="https://www.flaticon.com/kr/free-icons/github" title="github 아이콘"></a>
            <p class="m-0 text-center text-white"><img src ="https://cdn-icons-png.flaticon.com/512/733/733609.png" width=30px height=30px/>&nbsp Github Address : <a href="https://github.com/barcataeeon/Re-surfy" class="m-0 text-center text-white"> https://github.com/barcataeeon/Re-surfy</a></p><br>
             </div>
        </footer>
    </body>
</html>

 <script type="text/javascript">
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
        $(".sidebar-nav")
        .attr("class","sidebar-nav navbar-collapse collapse")
        .attr("aria-expanded",'false')
        .attr("style","height:1px");
    });
    </script>