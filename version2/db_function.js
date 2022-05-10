var db = require('./db');

insert_error = function (request, response, error, str) {
    msg = error.sqlMessage;
    db.query(`insert into error_log(error_date, sqlmessage, pos) values(NOW(),?, ?);`, [msg, str], function (error2, result) {
        if (error2) {
            throw error2;
        }
        /***********
        에러 테이블에 에러 처리하고 오류가 발생하였다고 클라이언트에게 전송하는 코드를 넣어주세요

        ***********/
    });
}

///("jada", "여",  45)에 받아온 유저 정보가 들어가도록 고쳐주셔야합니다.
exports.user = function (request, response) {
    db.query(`call check_user(?,?, ?);`, [/*post에서 받은 name sex age*/], function (error, result) {
        if (error) {
            insert_error(request, response, error, "user정보 확인");
        }
        /******
         cms로 연결되도록 코드 작성 부탁드립니다. + cms로 uid, content name은 전달해야함
        ***/

    });

}
//원래 코드에 이부분만 복사해서 가져가서 추가하시면됩니다.
exports.cms = function (request, response) {
    db.query(`call UpdateCMS(?, ?);`, [/*post에서 받은 contentname, userid */], function (error, result) {
        if (error) {
            insert_error(request, response, error, "cms1");
        }
    });
    db.query(`select cnt from content where content_name =?`, ["top"/*post에서 받은 contentname */], function (error, result) {
        if (error) {
            insert_error(request, response, error, "cms2");
        }
        console.log(result[0].cnt);//위 예제의 경우 top의 cnt출력 cnt는 위 변수로 출력가능하니 console.log를 참고하시고 삭제하세요.

        /******
          getpath로 연결되도록 코드 작성 부탁드립니다. + getpaht로 cnt, content name은 전달해야함
         ***/
    });

}

exports.getpath = function (request, response) {
    db.query(`select category_idx from content  where content_name=? ; `, ["top"/**받은 컨텐츠 네임들어오게 바꿔주세요 */], function (error1, result1) {
        if (error1) {
            insert_error(request, response, error1, "getpath part1");
            throw error1;
        }

        db.query(`select category_name from category  where category_idx=? ; `, [result1[0].category_idx], function (error2, result2) {
            if (error2) {
                insert_error(request, response, error2, "getpath part2");
                throw error2;
            }
            category = result2[0].category_name; //위 예제의 경우 fashion출력
            /******
            얻은 path를 가공하여 파일을 전송해주는 코드를 작성해주시면됩니다. 추가로 cnt정보는 보내주어야합니다.(어떤식으로 줄지는 무연씨랑 이야기해보세요.)
             ***/
        });

    });
}
