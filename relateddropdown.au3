<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">
            <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            <script>            
            $(document).ready(function() {            
            
                    $result = $("#result");
                    
                    $("#options").change(function(e) {
                        var selected = $(this).val();
                        console.log('change:', selected);
                        if(selected === '--') return;
                        $.get("api.cfc?method=dostuff", {input:selected}, function(res) {
                            $result.html(res);
                        },"JSON");
                    });
            })
            </script>
    </head>
    <body>

        <form>
            <select id="options">
                <option>--</option>
                <option value="1">One</option>
                <option value="2">Two</option>
            </select>
        </form>
        
        <div id="result"></div>
        
    </body>
</html>