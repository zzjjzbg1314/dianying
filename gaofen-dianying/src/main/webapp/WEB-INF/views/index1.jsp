<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>  
  <script id="suggResult" type="text/x-jquery-tmpl">
      <li data-link="{{= url}}">
          <a href="{{= url}}" onclick="moreurl(this, {from:'movie_search_sugg'})">
              <img src="{{= img}}" width="40" />
              <p>
                  <em>{{= title}}</em>
                  {{if year}}
                      <span>{{= year}}</span>
                  {{/if}}
                  {{if sub_title}}
                      <br /><span>{{= sub_title}}</span>
                  {{/if}}
                  {{if address}}
                      <br /><span>{{= address}}</span>
                  {{/if}}
                  {{if episode}}
                      {{if episode=="unknow"}}
                          <br /><span>集数未知</span>
                      {{else}}
                          <br /><span>共{{= episode}}集</span>
                      {{/if}}
                  {{/if}}
              </p>
          </a>
      </li>
  </script>
  
<body>
    <div id="wrapper">
    <div id="content">
<ol class="grid_view">
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">1</em>
                    <a href="https://movie.douban.com/subject/1292052/">
                        <img alt="肖申克的救赎" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480747492.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1292052/" class="">
                            <span class="title">肖申克的救赎</span>
                                    <span class="title">&nbsp;/&nbsp;The Shawshank Redemption</span>
                                <span class="other">&nbsp;/&nbsp;月黑高飞(港)  /  刺激1995(台)</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 弗兰克·德拉邦特 Frank Darabont&nbsp;&nbsp;&nbsp;主演: 蒂姆·罗宾斯 Tim Robbins /...<br>
                            1994&nbsp;/&nbsp;美国&nbsp;/&nbsp;犯罪 剧情
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.6</span>
                                <span property="v:best" content="10.0"></span>
                                <span>794349人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">希望让人自由。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">2</em>
                    <a href="https://movie.douban.com/subject/1295644/">
                        <img alt="这个杀手不太冷" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p511118051.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1295644/" class="">
                            <span class="title">这个杀手不太冷</span>
                                    <span class="title">&nbsp;/&nbsp;Léon</span>
                                <span class="other">&nbsp;/&nbsp;杀手莱昂  /  终极追杀令(台)</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 吕克·贝松 Luc Besson&nbsp;&nbsp;&nbsp;主演: 让·雷诺 Jean Reno / 娜塔丽·波特曼 ...<br>
                            1994&nbsp;/&nbsp;法国&nbsp;/&nbsp;剧情 动作 犯罪
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.4</span>
                                <span property="v:best" content="10.0"></span>
                                <span>762573人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">怪蜀黍和小萝莉不得不说的故事。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">3</em>
                    <a href="https://movie.douban.com/subject/1291546/">
                        <img alt="霸王别姬" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910813120.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1291546/" class="">
                            <span class="title">霸王别姬</span>
                                <span class="other">&nbsp;/&nbsp;再见，我的妾  /  Farewell My Concubine</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 陈凯歌 Kaige Chen&nbsp;&nbsp;&nbsp;主演: 张国荣 Leslie Cheung / 张丰毅 Fengyi Zha...<br>
                            1993&nbsp;/&nbsp;中国大陆 香港&nbsp;/&nbsp;剧情 爱情 同性
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.5</span>
                                <span property="v:best" content="10.0"></span>
                                <span>560452人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">风华绝代。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">4</em>
                    <a href="https://movie.douban.com/subject/1292720/">
                        <img alt="阿甘正传" src="https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p510876377.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1292720/" class="">
                            <span class="title">阿甘正传</span>
                                    <span class="title">&nbsp;/&nbsp;Forrest Gump</span>
                                <span class="other">&nbsp;/&nbsp;福雷斯特·冈普</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: Robert Zemeckis&nbsp;&nbsp;&nbsp;主演: Tom Hanks / Robin Wright Penn / Gary Sinise<br>
                            1994&nbsp;/&nbsp;美国&nbsp;/&nbsp;剧情 爱情
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.4</span>
                                <span property="v:best" content="10.0"></span>
                                <span>656929人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">一部美国近现代史。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">5</em>
                    <a href="https://movie.douban.com/subject/1292063/">
                        <img alt="美丽人生" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p510861873.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1292063/" class="">
                            <span class="title">美丽人生</span>
                                    <span class="title">&nbsp;/&nbsp;La vita è bella</span>
                                <span class="other">&nbsp;/&nbsp;一个快乐的传说(港)  /  Life Is Beautiful</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 罗伯托·贝尼尼 Roberto Benigni&nbsp;&nbsp;&nbsp;主演: 罗伯托·贝尼尼 Roberto Beni...<br>
                            1997&nbsp;/&nbsp;意大利&nbsp;/&nbsp;剧情 喜剧 爱情 战争
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.5</span>
                                <span property="v:best" content="10.0"></span>
                                <span>379210人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">最美的谎言。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">6</em>
                    <a href="https://movie.douban.com/subject/1291561/">
                        <img alt="千与千寻" src="https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p1910830216.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1291561/" class="">
                            <span class="title">千与千寻</span>
                                    <span class="title">&nbsp;/&nbsp;千と千尋の神隠し</span>
                                <span class="other">&nbsp;/&nbsp;神隐少女(台)  /  Spirited Away</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 宫崎骏 Hayao Miyazaki&nbsp;&nbsp;&nbsp;主演: 柊瑠美 Rumi Hîragi / 入野自由 Miy...<br>
                            2001&nbsp;/&nbsp;日本&nbsp;/&nbsp;剧情 动画 奇幻
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.2</span>
                                <span property="v:best" content="10.0"></span>
                                <span>609011人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">最好的宫崎骏，最好的久石让。 </span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">7</em>
                    <a href="https://movie.douban.com/subject/1295124/">
                        <img alt="辛德勒的名单" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p492406163.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1295124/" class="">
                            <span class="title">辛德勒的名单</span>
                                    <span class="title">&nbsp;/&nbsp;Schindler&#39;s List</span>
                                <span class="other">&nbsp;/&nbsp;舒特拉的名单(港)  /  辛德勒名单</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 史蒂文·斯皮尔伯格 Steven Spielberg&nbsp;&nbsp;&nbsp;主演: 连姆·尼森 Liam Neeson...<br>
                            1993&nbsp;/&nbsp;美国&nbsp;/&nbsp;剧情 历史 战争
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.4</span>
                                <span property="v:best" content="10.0"></span>
                                <span>351555人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">拯救一个人，就是拯救整个世界。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">8</em>
                    <a href="https://movie.douban.com/subject/1292722/">
                        <img alt="泰坦尼克号" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p457760035.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1292722/" class="">
                            <span class="title">泰坦尼克号</span>
                                    <span class="title">&nbsp;/&nbsp;Titanic</span>
                                <span class="other">&nbsp;/&nbsp;铁达尼号(港 / 台)</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 詹姆斯·卡梅隆 James Cameron&nbsp;&nbsp;&nbsp;主演: 莱昂纳多·迪卡普里奥 Leonardo...<br>
                            1997&nbsp;/&nbsp;美国&nbsp;/&nbsp;剧情 爱情 灾难
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.2</span>
                                <span property="v:best" content="10.0"></span>
                                <span>603931人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">失去的才是永恒的。 </span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">9</em>
                    <a href="https://movie.douban.com/subject/3541415/">
                        <img alt="盗梦空间" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p513344864.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/3541415/" class="">
                            <span class="title">盗梦空间</span>
                                    <span class="title">&nbsp;/&nbsp;Inception</span>
                                <span class="other">&nbsp;/&nbsp;潜行凶间(港)  /  全面启动(台)</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 克里斯托弗·诺兰 Christopher Nolan&nbsp;&nbsp;&nbsp;主演: 莱昂纳多·迪卡普里奥 Le...<br>
                            2010&nbsp;/&nbsp;美国 英国&nbsp;/&nbsp;剧情 动作 科幻 悬疑 冒险
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.2</span>
                                <span property="v:best" content="10.0"></span>
                                <span>712910人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">诺兰给了我们一场无法盗取的梦。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">10</em>
                    <a href="https://movie.douban.com/subject/2131459/">
                        <img alt="机器人总动员" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p449665982.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/2131459/" class="">
                            <span class="title">机器人总动员</span>
                                    <span class="title">&nbsp;/&nbsp;WALL·E</span>
                                <span class="other">&nbsp;/&nbsp;瓦力(台)  /  太空奇兵·威E(港)</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 安德鲁·斯坦顿 Andrew Stanton&nbsp;&nbsp;&nbsp;主演: 本·贝尔特 Ben Burtt / 艾丽...<br>
                            2008&nbsp;/&nbsp;美国&nbsp;/&nbsp;喜剧 爱情 科幻 动画 冒险
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.3</span>
                                <span property="v:best" content="10.0"></span>
                                <span>468290人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">小瓦力，大人生。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">11</em>
                    <a href="https://movie.douban.com/subject/1292001/">
                        <img alt="海上钢琴师" src="https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p511146957.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1292001/" class="">
                            <span class="title">海上钢琴师</span>
                                    <span class="title">&nbsp;/&nbsp;La leggenda del pianista sull&#39;oceano</span>
                                <span class="other">&nbsp;/&nbsp;声光伴我飞(台)  /  一九零零的传奇(港)</span>
                        </a>


                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 朱塞佩·托纳多雷 Giuseppe Tornatore&nbsp;&nbsp;&nbsp;主演: 蒂姆·罗斯 Tim Roth / ...<br>
                            1998&nbsp;/&nbsp;意大利&nbsp;/&nbsp;剧情 音乐
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.2</span>
                                <span property="v:best" content="10.0"></span>
                                <span>560648人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">每个人都要走一条自己坚定了的路，就算是粉身碎骨。 </span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">12</em>
                    <a href="https://movie.douban.com/subject/3793023/">
                        <img alt="三傻大闹宝莱坞" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p579729551.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/3793023/" class="">
                            <span class="title">三傻大闹宝莱坞</span>
                                    <span class="title">&nbsp;/&nbsp;3 Idiots</span>
                                <span class="other">&nbsp;/&nbsp;三个傻瓜(台)  /  作死不离3兄弟(港)</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 拉库马·希拉尼 Rajkumar Hirani&nbsp;&nbsp;&nbsp;主演: 阿米尔·汗 Aamir Khan / 卡...<br>
                            2009&nbsp;/&nbsp;印度&nbsp;/&nbsp;剧情 喜剧 爱情 歌舞
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.1</span>
                                <span property="v:best" content="10.0"></span>
                                <span>617882人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">英俊版憨豆，高情商版谢耳朵。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">13</em>
                    <a href="https://movie.douban.com/subject/3011091/">
                        <img alt="忠犬八公的故事" src="https://img5.doubanio.com/view/movie_poster_cover/ipst/public/p524964016.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/3011091/" class="">
                            <span class="title">忠犬八公的故事</span>
                                    <span class="title">&nbsp;/&nbsp;Hachi: A Dog&#39;s Tale</span>
                                <span class="other">&nbsp;/&nbsp;忠犬小八(台)  /  秋田犬八千(港)</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 莱塞·霍尔斯道姆 Lasse Hallström&nbsp;&nbsp;&nbsp;主演: 理查·基尔 Richard Ger...<br>
                            2009&nbsp;/&nbsp;美国 英国&nbsp;/&nbsp;剧情
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.2</span>
                                <span property="v:best" content="10.0"></span>
                                <span>410401人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">永远都不能忘记你所爱的人。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">14</em>
                    <a href="https://movie.douban.com/subject/1291549/">
                        <img alt="放牛班的春天" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910824951.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1291549/" class="">
                            <span class="title">放牛班的春天</span>
                                    <span class="title">&nbsp;/&nbsp;Les choristes</span>
                                <span class="other">&nbsp;/&nbsp;歌声伴我心(港)  /  唱诗班男孩</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 克里斯托夫·巴拉蒂 Christophe Barratier&nbsp;&nbsp;&nbsp;主演: 杰拉尔·朱诺 Géra...<br>
                            2004&nbsp;/&nbsp;法国 瑞士 德国&nbsp;/&nbsp;剧情 音乐
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.2</span>
                                <span property="v:best" content="10.0"></span>
                                <span>418081人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">天籁一般的童声，是最接近上帝的存在。 </span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">15</em>
                    <a href="https://movie.douban.com/subject/1292213/">
                        <img alt="大话西游之大圣娶亲" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p648365452.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1292213/" class="">
                            <span class="title">大话西游之大圣娶亲</span>
                                    <span class="title">&nbsp;/&nbsp;西遊記大結局之仙履奇緣</span>
                                <span class="other">&nbsp;/&nbsp;西游记完结篇仙履奇缘  /  齐天大圣西游记</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 刘镇伟 Jeffrey Lau&nbsp;&nbsp;&nbsp;主演: 周星驰 Stephen Chow / 吴孟达 Man Tat Ng...<br>
                            1995&nbsp;/&nbsp;香港 中国大陆&nbsp;/&nbsp;动作 冒险 喜剧 奇幻 爱情
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.1</span>
                                <span property="v:best" content="10.0"></span>
                                <span>425101人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">一生所爱。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">16</em>
                    <a href="https://movie.douban.com/subject/1291841/">
                        <img alt="教父" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910907404.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1291841/" class="">
                            <span class="title">教父</span>
                                    <span class="title">&nbsp;/&nbsp;The Godfather</span>
                                <span class="other">&nbsp;/&nbsp;Mario Puzo&#39;s The Godfather</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 弗朗西斯·福特·科波拉 Francis Ford Coppola&nbsp;&nbsp;&nbsp;主演: 马龙·白兰度 M...<br>
                            1972&nbsp;/&nbsp;美国&nbsp;/&nbsp;剧情 犯罪
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.2</span>
                                <span property="v:best" content="10.0"></span>
                                <span>319345人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">千万不要记恨你的对手，这样会让你失去理智。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">17</em>
                    <a href="https://movie.douban.com/subject/1291560/">
                        <img alt="龙猫" src="https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1910829638.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1291560/" class="">
                            <span class="title">龙猫</span>
                                    <span class="title">&nbsp;/&nbsp;となりのトトロ</span>
                                <span class="other">&nbsp;/&nbsp;邻家的豆豆龙  /  隔壁的特特罗</span>
                        </a>


                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 宫崎骏 Hayao Miyazaki&nbsp;&nbsp;&nbsp;主演: 日高法子 Noriko Hidaka / 坂本千夏 Ch...<br>
                            1988&nbsp;/&nbsp;日本&nbsp;/&nbsp;动画 奇幻
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.1</span>
                                <span property="v:best" content="10.0"></span>
                                <span>388885人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">人人心中都有个龙猫，童年就永远不会消失。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">18</em>
                    <a href="https://movie.douban.com/subject/1300267/">
                        <img alt="乱世佳人" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1963126880.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1300267/" class="">
                            <span class="title">乱世佳人</span>
                                    <span class="title">&nbsp;/&nbsp;Gone with the Wind</span>
                                <span class="other">&nbsp;/&nbsp;飘</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: Victor Fleming / George Cukor&nbsp;&nbsp;&nbsp;主演: 克拉克·盖博 Clark Gable / ...<br>
                            1939&nbsp;/&nbsp;美国&nbsp;/&nbsp;剧情 爱情 战争
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.2</span>
                                <span property="v:best" content="10.0"></span>
                                <span>252062人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">Tomorrow is another day.</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">19</em>
                    <a href="https://movie.douban.com/subject/1292064/">
                        <img alt="楚门的世界" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p480420695.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1292064/" class="">
                            <span class="title">楚门的世界</span>
                                    <span class="title">&nbsp;/&nbsp;The Truman Show</span>
                                <span class="other">&nbsp;/&nbsp;真人Show(港)  /  真人戏</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 彼得·威尔 Peter Weir&nbsp;&nbsp;&nbsp;主演: 金·凯瑞 Jim Carrey / 劳拉·琳妮 Lau...<br>
                            1998&nbsp;/&nbsp;美国&nbsp;/&nbsp;剧情 科幻
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.0</span>
                                <span property="v:best" content="10.0"></span>
                                <span>410778人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">如果再也不能见到你，祝你早安，午安，晚安。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">20</em>
                    <a href="https://movie.douban.com/subject/1291828/">
                        <img alt="天堂电影院" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910901025.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1291828/" class="">
                            <span class="title">天堂电影院</span>
                                    <span class="title">&nbsp;/&nbsp;Nuovo Cinema Paradiso</span>
                                <span class="other">&nbsp;/&nbsp;星光伴我心(港)  /  新天堂乐园(台)</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 朱塞佩·托纳多雷 Giuseppe Tornatore&nbsp;&nbsp;&nbsp;主演: 安东娜拉·塔莉 Antonel...<br>
                            1988&nbsp;/&nbsp;意大利 法国&nbsp;/&nbsp;剧情 爱情
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.1</span>
                                <span property="v:best" content="10.0"></span>
                                <span>289821人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">那些吻戏，那些青春，都在影院的黑暗里被泪水冲刷得无比清晰。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">21</em>
                    <a href="https://movie.douban.com/subject/1849031/">
                        <img alt="当幸福来敲门" src="https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1312700628.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1849031/" class="">
                            <span class="title">当幸福来敲门</span>
                                    <span class="title">&nbsp;/&nbsp;The Pursuit of Happyness</span>
                                <span class="other">&nbsp;/&nbsp;寻找快乐的故事(港)  /  追求快乐</span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 加布里尔·穆奇诺 Gabriele Muccino&nbsp;&nbsp;&nbsp;主演: 威尔·史密斯 Will Smith ...<br>
                            2006&nbsp;/&nbsp;美国&nbsp;/&nbsp;剧情 传记 家庭
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">8.9</span>
                                <span property="v:best" content="10.0"></span>
                                <span>502198人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">平民励志片。 </span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">22</em>
                    <a href="https://movie.douban.com/subject/6786002/">
                        <img alt="触不可及" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1454261925.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/6786002/" class="">
                            <span class="title">触不可及</span>
                                    <span class="title">&nbsp;/&nbsp;Intouchables</span>
                                <span class="other">&nbsp;/&nbsp;闪亮人生(港)  /  逆转人生(台)</span>
                        </a>


                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 奥利维·那卡什 Olivier Nakache / 艾力克·托兰达 Eric Toledano&nbsp;&nbsp;&nbsp;主...<br>
                            2011&nbsp;/&nbsp;法国&nbsp;/&nbsp;剧情 喜剧
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.1</span>
                                <span property="v:best" content="10.0"></span>
                                <span>338538人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">满满温情的高雅喜剧。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">23</em>
                    <a href="https://movie.douban.com/subject/1292000/">
                        <img alt="搏击俱乐部" src="https://img1.doubanio.com/view/movie_poster_cover/ipst/public/p1910926158.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1292000/" class="">
                            <span class="title">搏击俱乐部</span>
                                    <span class="title">&nbsp;/&nbsp;Fight Club</span>
                                <span class="other">&nbsp;/&nbsp;搏击会(港)  /  斗阵俱乐部(台)</span>
                        </a>


                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 大卫·芬奇 David Fincher&nbsp;&nbsp;&nbsp;主演: 爱德华·诺顿 Edward Norton / 布拉...<br>
                            1999&nbsp;/&nbsp;美国 德国&nbsp;/&nbsp;剧情 动作 悬疑 惊悚
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.0</span>
                                <span property="v:best" content="10.0"></span>
                                <span>382468人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">邪恶与平庸蛰伏于同一个母体，在特定的时间互相对峙。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">24</em>
                    <a href="https://movie.douban.com/subject/1293182/">
                        <img alt="十二怒汉" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p2173577632.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1293182/" class="">
                            <span class="title">十二怒汉</span>
                                    <span class="title">&nbsp;/&nbsp;12 Angry Men</span>
                                <span class="other">&nbsp;/&nbsp;12怒汉  /  十二怒汉</span>
                        </a>


                    </div>
                    <div class="bd">
                        <p class="">
                            导演: Sidney Lumet&nbsp;&nbsp;&nbsp;主演: 亨利·方达 Henry Fonda / 马丁·鲍尔萨姆 Marti...<br>
                            1957&nbsp;/&nbsp;美国&nbsp;/&nbsp;剧情
                        </p>

                        
                        <div class="star">
                                <span class="rating5-t"></span>
                                <span class="rating_num" property="v:average">9.3</span>
                                <span property="v:best" content="10.0"></span>
                                <span>156992人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">1957年的理想主义。 </span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
        <li>
            <div class="item">
                <div class="pic">
                    <em class="">25</em>
                    <a href="https://movie.douban.com/subject/1291552/">
                        <img alt="指环王3：王者无敌" src="https://img3.doubanio.com/view/movie_poster_cover/ipst/public/p1910825503.jpg" class="">
                    </a>
                </div>
                <div class="info">
                    <div class="hd">
                        <a href="https://movie.douban.com/subject/1291552/" class="">
                            <span class="title">指环王3：王者无敌</span>
                                    <span class="title">&nbsp;/&nbsp;The Lord of the Rings: The Return of the King</span>
                                <span class="other">&nbsp;/&nbsp;魔戒三部曲：王者再临(台 / 港) </span>
                        </a>


                            <span class="playable">[可播放]</span>
                    </div>
                    <div class="bd">
                        <p class="">
                            导演: 彼得·杰克逊 Peter Jackson&nbsp;&nbsp;&nbsp;主演: 维果·莫腾森 Viggo Mortensen / ...<br>
                            2003&nbsp;/&nbsp;美国 新西兰&nbsp;/&nbsp;剧情 动作 奇幻 冒险
                        </p>

                        
                        <div class="star">
                                <span class="rating45-t"></span>
                                <span class="rating_num" property="v:average">9.1</span>
                                <span property="v:best" content="10.0"></span>
                                <span>267375人评价</span>
                        </div>

                            <p class="quote">
                                <span class="inq">史诗的终章。</span>
                            </p>
                    </div>
                </div>
            </div>
        </li>
</ol>



    
    
    

        <div class="paginator">
        <span class="prev">
            &lt;前页
        </span>
        
        

                <span class="thispage">1</span>
                
            <a href="?start=25&amp;filter=" >2</a>
        
                
            <a href="?start=50&amp;filter=" >3</a>
        
                
            <a href="?start=75&amp;filter=" >4</a>
        
                
            <a href="?start=100&amp;filter=" >5</a>
        
                
            <a href="?start=125&amp;filter=" >6</a>
        
                
            <a href="?start=150&amp;filter=" >7</a>
        
                
            <a href="?start=175&amp;filter=" >8</a>
        
                
            <a href="?start=200&amp;filter=" >9</a>
        
                
            <a href="?start=225&amp;filter=" >10</a>
        
        <span class="next">
            <link rel="next" href="?start=25&amp;filter="/>
            <a href="?start=25&amp;filter=" >后页&gt;</a>
        </span>

            <span class="count">(共250条)</span>
        </div>

5    </div>
    <script type="text/javascript" src="https://img3.doubanio.com/misc/mixed_static/12a07dbde627f3d3.js"></script>
        
        
    <link rel="stylesheet" type="text/css" href="https://img3.doubanio.com/f/shire/8377b9498330a2e6f056d863987cc7a37eb4d486/css/ui/dialog.css" />
    <link rel="stylesheet" type="text/css" href="https://img3.doubanio.com/f/movie/7345d4b259505f1a074773ce6b54f0253df2bb88/css/movie/mod/reg_login_pop.css" />
    <script type="text/javascript" src="https://img3.doubanio.com/f/shire/77323ae72a612bba8b65f845491513ff3329b1bb/js/do.js" data-cfg-autoload="false"></script>
    <script type="text/javascript" src="https://img3.doubanio.com/f/shire/3d185ca912c999ee7f464749201139ebf8eb6972/js/ui/dialog.js"></script>
    <script type="text/javascript">
        var HTTPS_DB='https://www.douban.com';
var account_pop={open:function(e,b){if(b){referrer="?referrer="+encodeURIComponent(b)}else{referrer="?referrer="+window.location.href}var f="",a="",i=382;if(e==="reg"){f="用户注册";a="https://accounts.douban.com/popup/login?source=movie#popup_register";i=480}else{if(e==="login"){f="用户登录";a="https://accounts.douban.com/popup/login?source=movie"}}var h=document.location.protocol+"//"+document.location.hostname;var d=dui.Dialog({width:478,title:f,height:i,cls:"account_pop",isHideTitle:true,modal:true,content:"<iframe scrolling='no' frameborder='0' width='478' height='"+i+"' src='"+a+"' name='"+h+"'></iframe>"},true),c=d.node;c.undelegate();c.delegate(".dui-dialog-close","click",function(){var j=$("body");j.find("#login_msk").hide();j.find(".account_pop").remove()});if($(window).width()<478){var g="";if(e==="reg"){g=HTTPS_DB+"/accounts/register"+referrer}else{if(e==="login"){g=HTTPS_DB+"/accounts/login"+referrer}}window.location.href=g}else{d.open()}$(window).bind("message",function(j){if(j.originalEvent.origin==="https://accounts.douban.com"){c.find("iframe").css("height",j.originalEvent.data);c.height(j.originalEvent.data);d.update()}})}};if(Douban&&Douban.init_show_login){Douban.init_show_login=function(b){var a=$(b);a.click(function(){var c=a.data("ref")||"";account_pop.open("login",c);return false})}}Do(function(){$("body").delegate(".pop_register","click",function(b){b.preventDefault();var a=$(this).data("ref")||"";account_pop.open("reg",a);return false});$("body").delegate(".pop_login","click",function(b){b.preventDefault();var a=$(this).data("ref")||"";account_pop.open("login",a);return false})});
    </script>

    
    




    
<script type="text/javascript">
    (function (global) {
        var newNode = global.document.createElement('script'),
            existingNode = global.document.getElementsByTagName('script')[0],
            adSource = '//erebor.douban.com/',
            userId = '',
            browserId = 'ZTRgOWM7240',
            criteria = '3:/top250',
            preview = '',
            debug = false,
            adSlots = ['dale_movie_top250_bottom_right'];

        global.DoubanAdRequest = {src: adSource, uid: userId, bid: browserId, crtr: criteria, prv: preview, debug: debug};
        global.DoubanAdSlots = (global.DoubanAdSlots || []).concat(adSlots);

        newNode.setAttribute('type', 'text/javascript');
        newNode.setAttribute('src', 'https://img3.doubanio.com/f/shire/99a1c905fb5a6d46d8e742d60199e3a99414a580/js/ad.js');
        newNode.setAttribute('async', true);
        existingNode.parentNode.insertBefore(newNode, existingNode);
    })(this);
</script>











    
  









<script type="text/javascript">
var _paq = _paq || [];
_paq.push(['trackPageView']);
_paq.push(['enableLinkTracking']);
(function() {
    var p=(('https:' == document.location.protocol) ? 'https' : 'http'), u=p+'://fundin.douban.com/';
    _paq.push(['setTrackerUrl', u+'piwik']);
    _paq.push(['setSiteId', '100001']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript';
    g.defer=true;
    g.async=true;
    g.src=p+'://img3.doubanio.com/dae/fundin/piwik.js';
    s.parentNode.insertBefore(g,s);
})();
</script>

<script type="text/javascript">
var setMethodWithNs = function(namespace) {
  var ns = namespace ? namespace + '.' : ''
    , fn = function(string) {
        if(!ns) {return string}
        return ns + string
      }
  return fn
}

var gaWithNamespace = function(fn, namespace) {
  var method = setMethodWithNs(namespace)
  fn.call(this, method)
}

var _gaq = _gaq || []
  , accounts = [
      { id: 'UA-7019765-1', namespace: 'douban' }
    , { id: 'UA-7019765-19', namespace: '' }
    ]
  , gaInit = function(account) {
      gaWithNamespace(function(method) {
        gaInitFn.call(this, method, account)
      }, account.namespace)
    }
  , gaInitFn = function(method, account) {
      _gaq.push([method('_setAccount'), account.id]);
      _gaq.push([method('_setSampleRate'), '5']);

      
  _gaq.push([method('_addOrganic'), 'google', 'q'])
  _gaq.push([method('_addOrganic'), 'baidu', 'wd'])
  _gaq.push([method('_addOrganic'), 'soso', 'w'])
  _gaq.push([method('_addOrganic'), 'youdao', 'q'])
  _gaq.push([method('_addOrganic'), 'so.360.cn', 'q'])
  _gaq.push([method('_addOrganic'), 'sogou', 'query'])
  if (account.namespace) {
    _gaq.push([method('_addIgnoredOrganic'), '豆瓣'])
    _gaq.push([method('_addIgnoredOrganic'), 'douban'])
    _gaq.push([method('_addIgnoredOrganic'), '豆瓣网'])
    _gaq.push([method('_addIgnoredOrganic'), 'www.douban.com'])
  }

      if (account.namespace === 'douban') {
        _gaq.push([method('_setDomainName'), '.douban.com'])
      }

        _gaq.push([method('_setCustomVar'), 1, 'responsive_view_mode', 'desktop', 3])

        _gaq.push([method('_setCustomVar'), 2, 'login_status', '0', 2]);

      _gaq.push([method('_trackPageview')])
    }

for(var i = 0, l = accounts.length; i < l; i++) {
  var account = accounts[i]
  gaInit(account)
}
;(function() {
    var ga = document.createElement('script');
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    ga.setAttribute('async', 'true');
    document.documentElement.firstChild.appendChild(ga);
})()
</script>
  <script>_SPLITTEST=''</script>
</body>

<%@ include file="footer.jsp"%>

