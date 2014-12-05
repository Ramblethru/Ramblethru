var Imtech4 = {};
Imtech4.Pager = function() {
    this.paragraphsPerPage = 3;
    this.currentPage = 1;
    this.pagingControlsContainer = "#pagingControls4";
    this.pagingContainerPath = "#content4";

    this.numPages4 = function() {
        var numPages4 = 0;
        if (this.paragraphs != null && this.paragraphsPerPage != null) {
            numPages4 = Math.ceil(this.paragraphs.length / this.paragraphsPerPage);
        }

        return numPages4;
    };

    this.showPage = function(page) {
        this.currentPage = page;
        var html4 = "";
        for (var m = (page-1)*this.paragraphsPerPage; m < ((page-1)*this.paragraphsPerPage) + this.paragraphsPerPage; m++) {
            if (m < this.paragraphs.length) {
                var elem4 = this.paragraphs.get(m);
                html4 += "<" + elem4.tagName + ">" + elem4.innerHTML + "</" + elem4.tagName + ">";
            }
        }

        $(this.pagingContainerPath).html(html4);

        renderControls4(this.pagingControlsContainer, this.currentPage, this.numPages4());
    }

    var renderControls4 = function(container, currentPage, numPages4) {
        var pagingControls4 = "<ul>";
        for (var m = 1; m <= numPages4; m++) {
            if (m != currentPage) {
                pagingControls4 += "<li><a href='#' onclick='pager4.showPage(" + m + "); return false;'>" + m + "</a></li>";
            } else {
                pagingControls4 += "<li>" + m + "</li>";
            }
        }

        pagingControls4 += "</ul>";

        jQuery(container).html(pagingControls4);
    }
}