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
    db.query(`call check_user("jada", "여", 45);`, function (error, result) {
        if (error) {
            insert_error(request, response, error, "user정보 확인");
        }
        /******
         CMS처리 파트로 넘어갈수 있는 코드를 작성해주셔야합니다. 이번주는 CMS파트는 진행하지 않을거라 path를 얻는 코드인 getpath로 연결되도록 코드 작성 부탁드립니다.
         ***/
    });
}

exports.getpath = function (request, response) {
    db.query(`select category_idx, path from content  where content_name=? ; `, ["사과"/**받은 컨텐츠 네임들어오게 바꿔주세요 */], function (error1, result1) {
        if (error1) {
            insert_error(request, response, error1, "getpath part1");
            throw error1;
        }
        db.query(`select category_name from category  where category_idx=? ; `, [result1[0].category_idx], function (error2, result2) {
            if (error2) {
                insert_error(request, response, error2, "getpath part2");
                throw error2;
            }
            path = result1[0].path;
            category = result2[0].category_name;
            console.log(path);
            console.log(category);
            /******
            얻은 path를 가공하여 파일을 전송해주는 코드를 작성해주시면됩니다.
             ***/
        });

    });
}
