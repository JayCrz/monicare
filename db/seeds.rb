# 輸入$rails db:seed新增過一次(若要二次新增，原本的資料要註解掉，不然會重複)
# 預設gendee: true為男
# 照片跟email還沒新增
# 功能也沒新增

Babyclass.create(nursery_class: '向日葵班')
Babyclass.create(nursery_class: '櫻花班')
Babyclass.create(nursery_class: '玫瑰班')


Teacher.create(name: '吉永綠', gender: false, address: '埼玉縣春日部市雙葉町800號', tel: 20378508)
Teacher.create(name: '上尾真澄', gender: false, address: '埼玉縣春日部市雙葉町802號', tel: 20489619)
Teacher.create(name: '松坂梅', gender: false, address: '埼玉縣春日部市雙葉町804號', tel: 20590720)

Child.create(name: '野原新之助', gender: true, birthday: '2017-07-22', address: '埼玉縣春日部市雙葉町904號', tel: 20170722, babyclass_id: 1)
Child.create(name: '風間徹', gender: true, birthday: '2017-09-28', address: '埼玉縣春日部市雙葉町903號', tel: 20170928, babyclass_id: 1)
Child.create(name: '佐藤正男', gender: true, birthday: '2017-02-30', address: '埼玉縣春日部市雙葉町902號', tel: 20170230, babyclass_id: 1)
Child.create(name: '井川棒太郎', gender: true, birthday: '2017-05-23', address: '埼玉縣春日部市雙葉町901號', tel: 20170523, babyclass_id: 1)
Child.create(name: '櫻田妮妮', gender: false, birthday: '2017-06-05', address: '埼玉縣春日部市雙葉町900號', tel: 20170605, babyclass_id: 1)
Child.create(name: '酢乙女愛', gender: false, birthday: '2017-10-02', address: '埼玉縣春日部市雙葉町905號', tel: 20171002, babyclass_id: 1)

Child.create(name: '崎山弘也', gender: true, birthday: '2017-01-11', address: '埼玉縣春日部市雙葉町930號', tel: 20170111, babyclass_id: 2)
Child.create(name: '卡莉妞妞', gender: false, birthday: '2017-02-03', address: '埼玉縣春日部市雙葉町931號', tel: 20170203, babyclass_id: 2)
Child.create(name: '愛藤皆子', gender: false, birthday: '2017-08-15', address: '埼玉縣春日部市雙葉町932號', tel: 20170815, babyclass_id: 2)

Child.create(name: '河村康雄', gender: true, birthday: '2017-01-15', address: '埼玉縣春日部市雙葉町910號', tel: 20170115, babyclass_id: 3)
Child.create(name: '雨賀得男', gender: true, birthday: '2017-03-12', address: '埼玉縣春日部市雙葉町911號', tel: 20170312, babyclass_id: 3)
Child.create(name: '南島康介', gender: true, birthday: '2017-09-17', address: '埼玉縣春日部市雙葉町912號', tel: 20170917, babyclass_id: 3)
Child.create(name: '秋風舞', gender: false, birthday: '2017-11-03', address: '埼玉縣春日部市雙葉町913號', tel: 20171103, babyclass_id: 3)
Child.create(name: '阿久瀨留美', gender: false, birthday: '2017-12-28', address: '埼玉縣春日部市雙葉町914號', tel: 20171228, babyclass_id: 3)

ClassTeacher.create(babyclass_id: 1, teacher_id: 1)
ClassTeacher.create(babyclass_id: 2, teacher_id: 2)
ClassTeacher.create(babyclass_id: 3, teacher_id: 3)

ChildTeacher.create(child_id: 1, teacher_id: 1)
ChildTeacher.create(child_id: 2, teacher_id: 1)
ChildTeacher.create(child_id: 3, teacher_id: 1)
ChildTeacher.create(child_id: 4, teacher_id: 1)
ChildTeacher.create(child_id: 5, teacher_id: 1)
ChildTeacher.create(child_id: 6, teacher_id: 1)

ChildTeacher.create(child_id: 7, teacher_id: 2)
ChildTeacher.create(child_id: 8, teacher_id: 2)
ChildTeacher.create(child_id: 9, teacher_id: 2)

ChildTeacher.create(child_id: 10, teacher_id: 3)
ChildTeacher.create(child_id: 11, teacher_id: 3)
ChildTeacher.create(child_id: 12, teacher_id: 3)
ChildTeacher.create(child_id: 13, teacher_id: 3)
ChildTeacher.create(child_id: 14, teacher_id: 3)