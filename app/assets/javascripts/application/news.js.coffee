$ ->

  pagesContainer = $('.news-list .news-list-wrapper')
  fullItemsContainer = $('.news-view .news-list-wrapper')
  maxPage = $('.news-list .pager:first a').size()
  maxItem = $('.news-view .pager:first a').size()

  prepareEmptyPages = ->
    for i in $('.news-list .pager a')
      i = $(i).attr('rel')
      if $("##{i}-news-page").size() == 0
  pagesContainer.append "<li class=\"news-list-page\" id=\"#{i}-news-page\"></li>"

  prepareEmptyFullItems = ->
    for i in $('.news-view .pager a')
      i = $(i).attr('rel')
      if $("##{i}-news-item").size() == 0
  fullItemsContainer.append """
    <li class="news-list-page news-item-wrap" id="#{i}-news-item"></li>
  """
    $('.news-view .pager li:first-child').after """
      <li class="ellipsis a">...</li>
    """
    $('.news-view .pager li:last-child').before """
      <li class="ellipsis b">...</li>
    """

  # Загружает страницу и всё что в ней есть (страницы и полные новости)
  # раскладывает по подготовленным полочкам
  loadPage = (i) ->
    $.get location.href, {page: i}, (data) ->
      data = $ data
      $("##{i}-news-page").replaceWith data.find("##{i}-news-page")
      pagesContainer.animate({
  'height': $("##{i}-news-page").height()
      }, 800)
      for newsItem in data.find('.news-item-wrap')
  $( '#'+$(newsItem).attr('id') ).replaceWith $(newsItem)


  showPage = (i) ->

    $('.news-view').slideUp()
    $('.news-list').slideDown()

    animate =
      left: (i - 1) * -100 + '%'

    if $("##{i}-news-page").html() == ''
      $("##{i}-news-page").html 'loading ...'
      loadPage(i)
    else
      animate.height = $("##{i}-news-page").height()

    pagesContainer.animate(animate, 800)

    $('.news-list .pager a').removeClass('active')
    $(".news-list .pager a[rel=#{i}]").addClass('active')


  showFullItem = (i) ->

    i = parseInt i

    $('.news-list').slideUp()
    $('.news-view').slideDown()

    if $('.news-item-wrap').eq( i-1 ).html() == ''
      $('.news-item-wrap').eq( i-1 ).html 'loading ...'
      loadPage( Math.ceil(i/3) ) # 3 - кол-во новостей на странице

    fullItemsContainer.animate {left: (i - 1) * -100 + '%'}, 800

    $('.news-view .pager a').removeClass('active')
    $(".news-view .pager a[rel=#{i}]").addClass('active')

    # Прячем диапазоны в пагинаторе полных новостей
    hideA = []
    hideB = []
    visibleNear = 2 # сколько чисел видно с каждого края от текущей
    if i > visibleNear + 2
      hideA = [2..(i-1-visibleNear)]
    if maxItem - i > visibleNear + 1
      hideB = [(i+visibleNear+1)..(maxItem-1)]
    hide = hideA.concat hideB

    # Прячем их
    $('.news-view .pager li').show()
    $('.news-view .pager li.ellipsis').hide()
    if hideA.length
      $('.news-view .pager li.ellipsis.a').show()
    if hideB.length
      $('.news-view .pager li.ellipsis.b').show()
    for pager in $('.news-view .pager')
      j = 0
      for item in $(pager).find('li:not(.ellipsis)')
  j++
  if j in hide
    $(item).hide()





  prepareEmptyPages()
  prepareEmptyFullItems()
  showPage(1)


  $(window).hashchange ->
    path = location.hash.split('/')
    return unless path[0] == '#news'

    destination = $('#news')
    if destination.size()
      $('html:not(:animated),body:not(:animated)').animate({ scrollTop: destination.offset().top}, 600)

    if path[1] == 'page' and 0 < path[2] <= maxPage
      showPage(path[2])
      $('.news-link').attr 'href', location.hash
      $('.news-section').attr 'id', location.hash[1..]

    if path[1] == 'item' and 0 < path[2] <= maxItem
      showFullItem(path[2])
      $('.news-link').attr 'href', location.hash
      $('.news-section').attr 'id', location.hash[1..]


  $(window).hashchange()