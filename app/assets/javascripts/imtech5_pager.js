var Imtech5 = {};
Imtech5.Pager = function() {
    this.paragraphsPerPage = 3;
    this.currentPage = 1;
    this.pagingControlsContainer = "#pagingControls5";
    this.pagingContainerPath = "#content5";

    this.numPages5 = function() {
        var numPages5 = 0;
        if (this.paragraphs != null && this.paragraphsPerPage != null) {
            numPages5 = Math.ceil(this.paragraphs.length / this.paragraphsPerPage);
        }

        return numPages5;
    };

    this.showPage = function(page) {
        this.currentPage = page;
        var html5 = "";
        for (var p = (page-1)*this.paragraphsPerPage; p < ((page-1)*this.paragraphsPerPage) + this.paragraphsPerPage; p++) {
            if (p < this.paragraphs.length) {
                var elem5 = this.paragraphs.get(p);
                html5 += "<" + elem5.tagName + ">" + elem5.innerHTML + "</" + elem5.tagName + ">";
            }
        }

        $(this.pagingContainerPath).html(html5);

        renderControls5(this.pagingControlsContainer, this.currentPage, this.numPages5());
    }

    var renderControls5 = function(container, currentPage, numPages5) {
        var pagingControls5 = "<ul>";
        for (var p = 1; p <= numPages5; p++) {
            if (p != currentPage) {
                pagingControls5 += "<li><a href='#' onclick='pager5.showPage(" + p + "); return false;'>" + p + "</a></li>";
            } else {
                pagingControls5 += "<li>" + p + "</li>";
            }
        }

        pagingControls5 += "</ul>";

        jQuery(container).html(pagingControls5);
    }
}