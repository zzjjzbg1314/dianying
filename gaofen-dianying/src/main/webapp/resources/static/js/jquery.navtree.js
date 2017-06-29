/**
 * jQuery插件——筛选树
 *
 * @author Leesson
 * @version 1.0
 * @param {Array}|{Object} 用于筛选树的数据源列表，格式要求见README
 * @param {Object} 初始化选项，详见README
 * @return {Object} jQuery Object
 */
(function($) {
    jQuery.fn.extend({
        navtree: function(dataList, opts) {

            var opts = $.extend({
                title: "navtree",
                identify_field: "code",
                display_field: "name",
                childs_field: "childs",
                selected: "",
				node_style: "default",
                link_to: "#",
                callback:function() {return false;}
            }, opts || {});

            return $(this).each(function() {
                var nodeStyle = {
					"default": {
						"open": '<span class="f-i-arrow">></span>',
						"close": '<span class="f-i-arrow">></span>'
					},
					"cross": {
						"open": '<span class="f-i-cross">-</span>',
						"close": '<span class="f-i-cross">+</span>'
					}
				},
					panel = $(this),
                    titleDiv, bodyDiv;

                var init = function(data, grade) {
                    panel.empty();
                    buildFrame();
                    if(opts.selected) {
                        var drawed = drawList(data, grade);
                        if(!drawed) {
                            drawDefault();
                        }
                    } else {
                        drawDefault();
                    }
                }

                var drawDefault = function() {
                    bodyDiv.empty();
                    $.each(dataList, function(key, item) {
                        var options = $.extend(item, {grade: 0, isSelected: false});
                        var lnk = createLink(options).appendTo(bodyDiv);
                    });
                    opts.callback(null, panel);
                }

                var drawList = function(arrObj, grade) {
                    var matched = false,
                        options, lnk;
                    if(grade == undefined) {
                        grade = 0;
                    }
                    $.each(arrObj, function(key, item) {
                        var childs = item[opts.childs_field];
                        if(item[opts.identify_field] == opts.selected) {
                            matched = true;
                            //绘制选中项
                            options = $.extend(item, {grade: grade, isSelected: true});
                            lnk = createLink(options).appendTo(bodyDiv);

                            if(childs) {
                                //绘制选中项所有子项
                                $.each(childs, function(key, item1) {
                                    options = $.extend(item1, {grade: grade + 1, isSelected: false});
                                    lnk = createLink(options).appendTo(bodyDiv);
                                });
                            }

                            return false;
                        } else {
                            if(childs) {
                                matched = drawList(childs, grade + 1);
                                if(matched) {
                                    //绘制选中项父项
                                    options = $.extend(item, {grade: grade, isSelected: false});
                                    lnk = createLink(options);
                                    bodyDiv.prepend(lnk);
                                    return false;
                                }
                            }
                        }
                    });

                    return matched;
                }

                var buildFrame = function() {
                    panel.empty();
                    titleDiv = $('<div class="filter-hd"/>').appendTo(panel);
                    $('<a/>').text(opts.title)
                        .attr("title", opts.title)
                        .attr("href", opts.link_to.replace(/__id__/, ""))
                        .bind("click", drawDefault)
                        .appendTo(titleDiv);
                    bodyDiv = $('<div class="filter-bd"/>').appendTo(panel);
                }

                //itemOpts:grade,opts.display_field,opts.identify_field,isSelected
                var createLink = function(itemOpts) {
                    var link = $('<p class="filter-item"/>').addClass("tree-" + itemOpts.grade),
                        displayName = itemOpts[opts.display_field],
                        identifyCode = itemOpts[opts.identify_field],
						nodeIcon = nodeStyle[opts.node_style];
					if(!nodeIcon) {
						nodeIcon = nodeStyle["default"];
					}
                    if(itemOpts.isSelected) {
                        link.addClass("filter-active");
                        $('<span/>').text(displayName)
                            .attr("title", displayName)
                            .appendTo(link)
                            .before($(nodeIcon.open));
                    }
                    else {
                        $('<a/>').text(displayName)
                            .attr("href", opts.link_to.replace(/__id__/, identifyCode))
                            .attr("title", displayName)
                            .bind("click", clickHandler(itemOpts))
                            .appendTo(link)
                            .before($(nodeIcon.close));
                    }

                    return link;
                }

                var clickHandler = function(item) {
                    return function (evt) {
                        var identifyCode = item[opts.identify_field];
                        opts.selected = identifyCode;

                        if (bodyDiv) {
                            bodyDiv.empty();
                            drawList(dataList, 0);
                        } else {
                            init(dataList, 0);
                        }

                        var continuePropagation = opts.callback(item, panel);
                        if (!continuePropagation) {
                            if (evt.stopPropagation) {
                                evt.stopPropagation();
                            }
                            else {
                                evt.cancelBubble = true;
                            }
                        }

                        return continuePropagation;
                    }
                }

                init(dataList, 0);
            });
        }
    });
})(jQuery);
