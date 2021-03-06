var string1 = '补发2017.12.22=C2B我行平台=志祥=赵洋=上汽大通=09:05-19:50=库存车生产环境价格补录验证,我行用户红包,d90,盲订相关数据导出整合,根据openid导出419 d90定价信息,购车定金支付查询.';
var string2 = '请假2017.12.25=C2B我行平台=新致=陆张柳';
var string3 = 'D90选配=志祥=徐冲=上汽大通=09:00-18:00=新款V80选配方案会议。商城订单数据查询，维护。';

function formatData(string) {
    var arr = string.split('=');

    switch (arr[0].substring(0, 2)) {
        case '补发':
        case '请假':
            var day = arr[0].substring(2, arr[0].length);
            var startTime = arr[5] ? arr[5].split('-')[0] : '00:00';
            var endTime = arr[5] ? arr[5].split('-')[1] : '00:00';

            day = day.replace(/\./g, '-');

            return {
                type: arr[0].substring(0, 2),
                aaDateStart: day + ' ' + startTime,
                aaDateEnd: day + ' ' + endTime,
                itemGroup: arr[1],
                company: arr[2],
                aaName: arr[3],
                workAddress: arr[4],
                memo: arr[6],
            }
            break;
        default:
            var day = new Date().getFullYear() + '-' + (new Date().getMonth() + 1) + '-' + new Date().getDate();
            var startTime = arr[4] ? arr[4].split('-')[0] : '00:00';
            var endTime = arr[4] ? arr[4].split('-')[1] : '00:00';

            return {
                type: '正常',
                aaDateStart: day + ' ' + startTime,
                aaDateEnd: day + ' ' + endTime,
                itemGroup: arr[0],
                company: arr[1],
                aaName: arr[2],
                workAddress: arr[3],
                memo: arr[5],
            }
    }
}

$.ajax({
    url: '',
    method: 'GET',
    data: formatData(string1),
    success: function(res) {
        console.log(res);
    },
});