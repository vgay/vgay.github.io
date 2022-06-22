\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "chord-grid-JAS.ly"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 15)
                             (minimum-distance . 8)
                             (padding . 0))
  oddHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \null \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} }
  } }
  evenHeaderMarkup = \markup {
    \on-the-fly \print-page-number-check-first {
      \fill-line { \concat { \fromproperty #'page:page-number-string "/" \page-ref #'theLastPage "0" "?"} \null }
    }
  }
}

title = #"Early Autumn"
composer = #"Ralph Burns and Woody Herman"
meter = #"(Med. Ballad)"
kwtempo = #"Mod. Slow"
kwstyle = #"Ballad"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  %asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    \override Glissando #'style = #'zigzag
    \override Glissando.breakable = ##t
    \override Glissando.after-line-breaking = ##t
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
    \override MultiMeasureRest #'expand-limit = #3
  }
  \context {
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  \context { \Score markFormatter = #format-mark-box-alphabet }
}


verse = \lyricmode {
When an ear -- ly au -- tumn walks the land __ and chills the breeze
And tou -- ches with her hand __  the sum -- mer trees
Per -- haps you'll un -- der -- stand __ what me -- mo -- ries I own __
There's a dance pa

\repeat unfold 5 { \skip 1 } ours that start -- ed so A -- pril heart -- ed
Seemed made for just a boy and girl __
I ne -- ver dreamed, did you, an -- y fall would come in view
So ear -- ly, ear -- ly
Dar -- ling if you care, __ please, let me know
I'll meet you an -- y -- where, __ I miss you so
Let's ne -- ver have to share __ an -- oth -- er ear -- ly au -- tumn __
}

verseB = \lyricmode {
\repeat unfold 4 { \skip 1 } vi -- lion in the rain __ all shut -- t'red down
A win -- ding coun -- try lane __ all rus -- set brown
A fros -- ty win -- dow pane __ shows me a town grown \repeat unfold 5 { \skip 1 }lone -- ly __ That spring of
}

harmonies = \chordmode {
  \set chordChanges = ##f
 s2 c1:7+ b:7 bes:7+ a:7 as:7+ g:7
  c2:7+ a:m7 d:m7 g:7 c1*2:6
  d2:m7 g:13 e:m7 es:dim d2:m7 g:13 c1:7+9
  c2:m7 f:13 bes:7+ es:13 d4:7+ cis:7 c:9 b:9+ bes:7 a:7+ as:9- g:9
  c1:7+ b:7 bes:7+ a:7 as:7+ g:7 d:6
}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  \partial 2 g8 gis a bes
  \repeat volta 2 {
    \mark #1
    b g e c b'2 ~ | b8 c d c b4. bes8
    a f d bes a'2 ~ | a8 bes c bes a4. as8 |
    g es c as g'2 ~ | g8 as bes as g4. e8
  }
  \alternative {
    { g1 ~ | g4 r g8 gis a bes }
    { d,4 c2. ~ | c2 r8 g a b }
  }
  \bar "||" \break
  \mark #2
  c4. a8 e' e4. | r8 b d c b' b4.
  a4 g8 f e d e g | d2 ~ d8 g, a b
  c4. bes8 d4 b8 c | cis d f a c4 bes
  cis2 d | gis, a
  \bar "||" \break \mark #1
    b8 g e c b'2 ~ | b8 c d c b4. bes8
    a f d bes a'2 ~ | a8 bes c bes a4. as8  |
    g es c as g'2 ~ | g8 as bes as g4. e8
    d4 c2. ~ | c2 r2
  \bar ".."
   \label #'theLastPage
}

chordsRhythm = \relative c' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t
  % \partial 8
  % \showStartRepeatBar \bar "[|:"


}

Basse = \relative c' {
  \clef "bass" \key f \major \time 4/4
  % \partial 8
  % \showStartRepeatBar \bar "[|:"

  \bar ".."
}

grille = \chordmode {
  \bar "[|:" \mark #1
c1:7+ b:7 bes:7+ a:7 \break
as:7+ g:7 \set Score.repeatCommands = #'((volta "1.") ) c2:7+ a:m7 d:m7 g:7
\set Score.repeatCommands = #'((volta #f) end-repeat) \break
\stopStaff s1 \bar "" s \startStaff \set Score.repeatCommands = #'((volta "2.") )
\repeat percent 2 { c1:6 } \set Score.repeatCommands = #'((volta #f)) \bar "||" \break \mark #2
  d2:m7 g:13 e:m7 es:dim d2:m7 g:13 c1:7+9 \break
  c2:m7 f:13 bes:7+ es:13 d4:7+ cis:7 c:9 b:9+ bes:7 a:7+ as:9- g:9 \bar "||" \break \mark #1
  c1:7+ b:7 bes:7+ a:7 \break
  as:7+ g:7 \repeat percent 2 { d:6 }
  \bar ".." }



\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "BbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c d \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    %print-first-page-number = ##t
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          \transpose c a \theNotes
        >>
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          << \theNotes \\ { s2 s1*22 \break } >>
        >>
      >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    page-count = #1
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies }
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }
           \transpose c d \theNotes \\ { s2 s1*22 \break }
        >>
      >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c d \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice
          \transpose c a \theNotes \\ { s2 s1*22 \break }
        >>
      >>
    } %\form
    }  \bookpart {
    \score {
      \gridLayout
      \new ChordGrid \transpose c a \grille
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    print-page-number = ##f
    page-count = #1
  }
  #(define output-suffix "Vocala4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          << \theNotes
             \addlyrics \verse
             \addlyrics \verseB
             \\ { s2 s1*6 \break s1*16 \break } >>
        >>
      >>
 } } }

 \book {
  \paper {
    #(set-paper-size "a5landscape")
    print-first-page-number = ##t
  }
  #(define output-suffix "VocalTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol }
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }
          << \theNotes
             \addlyrics \verse
             \addlyrics \verseB
             \\ { s2 s1*6 \break s1*16 \break } >>
        >>
      >>
 } } }