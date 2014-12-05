var Imtech3 = {};
Imtech3.Pager = function() {
    this.paragraphsPerPage = 3;
    this.currentPage = 1;
    this.pagingControlsContainer = "#pagingControls3";
    this.pagingContainerPath = "#content3";

    this.numPages3 = function() {
        var numPages3 = 0;
        if (this.paragraphs != null && this.paragraphsPerPage != null) {
            numPages3 = Math.ceil(this.paragraphs.length / this.paragraphsPerPage);
        }

        return numPages3;
    };

    this.showPage = function(page) {
        this.currentPage = page;
        var html3 = "";
        for (var k = (page-1)*this.paragraphsPerPage; k < ((page-1)*this.paragraphsPerPage) + this.paragraphsPerPage; k++) {
            if (k < this.paragraphs.length) {
                var elem3 = this.paragraphs.get(k);
                html3 += "<" + elem3.tagName + ">" + elem3.innerHTML + "</" + elem3.tagName + ">";
            }
        }

        $(this.pagingContainerPath).html(html3);

        renderControls3(this.pagingControlsContainer, this.currentPage, this.numPages3());
    }

    var renderControls3 = function(container, currentPage, numPages3) {
        var pagingControls3 = "<ul>";
        for (var k = 1; k <= numPages3; k++) {
            if (k != currentPage) {
                pagingControls3 += "<li><a href='#' onclick='pager3.showPage(" + k + "); return false;'>" + k + "</a></li>";
            } else {
                pagingControls3 += "<li>" + k + "</li>";
            }
        }

        pagingControls3 += "</ul>";

        jQuery(container).html(pagingControls3);
    }
}