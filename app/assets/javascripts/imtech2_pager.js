var Imtech2 = {};
Imtech2.Pager = function() {
    this.paragraphsPerPage = 3;
    this.currentPage = 1;
    this.pagingControlsContainer = "#pagingControls2";
    this.pagingContainerPath = "#content2";

    this.numPages2 = function() {
        var numPages2 = 0;
        if (this.paragraphs != null && this.paragraphsPerPage != null) {
            numPages2 = Math.ceil(this.paragraphs.length / this.paragraphsPerPage);
        }

        return numPages2;
    };

    this.showPage = function(page) {
        this.currentPage = page;
        var html2 = "";
        for (var j = (page-1)*this.paragraphsPerPage; j < ((page-1)*this.paragraphsPerPage) + this.paragraphsPerPage; j++) {
            if (j < this.paragraphs.length) {
                var elem2 = this.paragraphs.get(j);
                html2 += "<" + elem2.tagName + ">" + elem2.innerHTML + "</" + elem2.tagName + ">";
            }
        }

        $(this.pagingContainerPath).html(html2);

        renderControls2(this.pagingControlsContainer, this.currentPage, this.numPages2());
    }

    var renderControls2 = function(container, currentPage, numPages2) {
        var pagingControls2 = "<ul>";
        for (var j = 1; j <= numPages2; j++) {
            if (j != currentPage) {
                pagingControls2 += "<li><a href='#' onclick='pager2.showPage(" + j + "); return false;'>" + j + "</a></li>";
            } else {
                pagingControls2 += "<li>" + j + "</li>";
            }
        }

        pagingControls2 += "</ul>";

        $(container).html(pagingControls2);
    }
}